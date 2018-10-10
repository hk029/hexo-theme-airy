{% if not is_post() %}
  <nav class="pagination">
      {{paginator({prev_text:'上一页',next_text:'下一页'})}}
  </nav>
{% else %}
  <nav class="pagination">
    {% if page.prev.path %}
      <a class="prev" href="{{ url_for(page.prev.path) }}">
        <i class="far icon-left"></i>
        <span class="prev-text nav-default">{{ page.prev.title }}</span>
      </a>
    {% endif %}
    {% if page.next.path %}
      <a class="next" href="{{ url_for(page.next.path) }}">
        <span class="next-text nav-default">{{ page.next.title }}</span>
        <i class="iconfont icon-right"></i>
      </a>
    {% endif %}
  </nav>
{% endif %}
