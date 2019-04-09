'use strict';

const front = require('hexo-front-matter');
const moment = require('moment');
const fs = require('fs');
const path = require('path');

function fix2number(n) {
    return [0, n].join('').slice(-2);
}

const whiteList = {
    categories: 1,
    tags: 1,
    about: 1,
    search: 1,
};

const ignoreList = {
    README: 1
};

function getTime(curdate, format) {
    if (format == undefined) return curdate;
    format = format.replace(/Y/gi, curdate.getFullYear());
    format = format.replace(/m/gi, fix2number(curdate.getMonth() + 1));
    format = format.replace(/d/gi, fix2number(curdate.getDate()));
    format = format.replace(/H/gi, fix2number(curdate.getHours()));
    format = format.replace(/i/gi, fix2number(curdate.getMinutes()));
    format = format.replace(/s/gi, fix2number(curdate.getSeconds()));
    format = format.replace(/ms/gi, curdate.getMilliseconds());
    return format;
}

hexo.extend.filter.register(
    'before_post_render',
    function(data) {
        const { log } = this;
        // 检查当前post是否有title字段
        if (!whiteList[data.title] && !data.init) {
        // if (!whiteList[data.title]) {
            console.log('data:', data.title, data.init);
            // console.log('data:', data);
            let postInfo = '';
            let catList = data.slug.split('/');
            let tmp_title = catList.splice(-1, 1)[0];
            // 再提取的是默认tags
            let tmp_tags = catList.slice(-1);
            // 最后一项是标题，单独提取
            let title = data.title || tmp_title;
            let date = null;
            let tags = data.tags.data.map(t => t.name);
            console.log(tags, tmp_tags);
            tags = tags.length > 0 ? tags : tmp_tags;
            if (data.date) {
                date = data.date.format('YYYY-MM-DD');
            } else {
                let stat = fs.statSync(path.resolve(__dirname), data.source);
                date = moment(new Date(stat.birthtime)).format('YYYY-MM-DD');
            }
            postInfo = `---
title: ${title}
date: ${date}
categories: ${catList.map(c => `\n- ${c}`).join('')}
tags: ${tags.map(c => `\n- ${c}`).join('')}
init: 1
---
${data.raw
    .replace(/---[\s|\S]*?---/g, '')
    .replace(/o7bk1ffzo\.bkt\.clouddn\.com/g, 'hksite.cn')
    .replace(/easyread\.top/g, 'hksite.cn')
    .trim()
}`;
            fs.writeFileSync(data.full_source, postInfo, 'utf-8');
            log.i(`Generated PostInfo for post ${data.source}`);
            return postInfo;
        }
        // console.log(data.title);
        if (ignoreList[data.title]) {
            console.log(data.title);
            return null;
        }
        return data;
    },
    1
);
