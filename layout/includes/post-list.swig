
{% if page.posts.length > 0 %}
  <div class="recent-posts card nopadding">
    {% for postItem in page.posts.toArray() %}
    <a href="{{ config.root }}{{ postItem.path }}">
      <div class="recent-post-item">
          {% include "./post-items.swig"%}
      </div>
    </a>
    {% endfor %}
  </div>
{% endif %}
