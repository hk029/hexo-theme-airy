
{% if page.posts.length > 0 %}
  <div class="post-list card nopadding">
    {% for postItem in page.posts.toArray() %}
    <a href="{{ config.root }}{{ postItem.path }}">
      <div class="post-item">
          {% include "./post-items.swig"%}
      </div>
    </a>
    {% endfor %}
  </div>
{% endif %}
