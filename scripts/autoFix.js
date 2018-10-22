"use strict";

var front = require("hexo-front-matter");
var fs = require("fs");
var path = require("path");

function fix2number(n) {
  return [0, n].join("").slice(-2);
}

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
  "before_post_render",
  function(data) {
    const { theme, log } = this;
    if (theme.autoPostInfo) {
    }
    // 检查当前post是否有title字段
    if (!data.title) {
      console.log("data:", data.tags[0]);
      let postInfo = "";
      let catList = data.slug.split("/");
      // 最后一项是标题，单独提取
      let title = catList.splice(-1, 1)[0];
      let date = null;
      let tags = [];
      if (data.date) {
        date = getTime(new Date(data.date), "Y-M-D");
      } else {
        let stat = fs.statSync(path.resolve(__dirname), data.source);
        date = getTime(new Date(stat.birthtime), "Y-M-D");
      }
      if (data.tags) {
        tags = data.tags.map(t => t.name);
      }
      postInfo = `---
title: ${title}
date: ${date}
categories: ${catList.map(c => `\n- ${c}`).join("")}
tags: ${tags.map(c => `\n- ${c}`).join("")}
---
${data.raw
        .replace(/---[\s|\S]*---/g, "")
        .replace(/o7bk1ffzo\.bkt\.clouddn\.com/g, "easyread.top")}
    `;
      fs.writeFileSync(data.full_source, postInfo, "utf-8");
      log.i(`Generated PostInfo for post ${data.source}`);
      return postInfo;
    }
    return data;
  },
  1
);
