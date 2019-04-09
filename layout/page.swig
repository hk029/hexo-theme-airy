{% extends 'includes/layout.swig' %}
{% set cate = list_cate({ show_count: false }) %}
{% block body %}
{% if page.title == 'categories'%}
    <div class="card h340">
        {% include 'includes/post-list.swig' %}
        {% if cate %}
            {% autoescape false %}
            {{cate}}
            {% endautoescape %}
        {% else %}
            <p>{{ _p(None)}}.</p>
        {% endif %}
    </div>
{% elif page.title == 'tags'%}
    <div class="card h340 tag-archive">
        {{tagcloud(site.tags, {min_font: 14, max_font: 36})}}
    </div>
{% elif page.title == 'search'%}
 {% include './search.swig' %}
{% else %}
<article id="page">
  <div class="card h340">
    <div class="entry">
      {{ page.title }}
      {% autoescape false %}{{page.content }}{% endautoescape %}
    </div>
  </div>
</article>
{% endif %}

{% endblock %}