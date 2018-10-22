hexo.extend.helper.register("list_cate", options => {
  const categories = hexo.locals.get("categories");
  const url_for = hexo.extend.helper.get("url_for").bind(hexo);
  const theme = hexo.theme.config;
  const className = "category";
  const depth = options.depth ? parseInt(options.depth, 10) : 0;
  const orderby = options.orderby || "name";
  const order = options.order || 1;
  const suffix = options.suffix || "";
  let result = "";

  if (!categories || !categories.length) return "";
  options = options || {};

  function prepareQuery(parent) {
    const query = {};

    if (parent) {
      query.parent = parent;
    } else {
      query.parent = { $exists: false };
    }

    return categories
      .find(query)
      .sort(orderby, order)
      .filter(cat => cat.length);
  }

  function hierarchicalList(level, parent) {
    let result = "";

    prepareQuery(parent).forEach((cat, i) => {
      let child;
      if (!depth || level + 1 < depth) {
        child = hierarchicalList(level + 1, cat._id);
      }

      if (theme.categories && theme.categories[cat.name]) {
        let img = theme.categories[cat.name].img;
        result += `<li class="${className}-list-item" style="background-image:url(${img})">`;
      } else {
        result += `<li class="${className}-list-item" ">`;
      }

      result += `<a class="${className}-list-link" href="${url_for(
        cat.path
      )}${suffix}" backgour>`;
      result += cat.name;
      result += "</a>";

      if (child) {
        result += `<ul class="${className}-list-child">${child}</ul>`;
      }

      result += "</li>";
    });

    return result;
  }

  result += `<ul class="${className}-list">${hierarchicalList(0)}</ul>`;

  return result;
});

hexo.extend.helper.register("fancybox", content => {
  let reg = /<img src="(.*?)".*?>/g;
  return content.replace(
    reg,
    (img, src) => `<a data-fancybox="gallery" href="${src}"> ${img} </a>`
  );
});
