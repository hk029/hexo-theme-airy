{% extends 'includes/layout.swig' %}
{% set cate = list_cate({ show_count: false }) %}
{% block body %}
{% if page.title == 'categoriesgs'%}
<div class="card h340">
  {% if cate %}
  {% autoescape false %}
  {{cate}}
  {% endautoescape %}
  {% else %}
  <p>{{ _p(None)}}.</p>
  {% endif %}
</div>

{% else %}
<article id="page">
  <div class="card h340">
    <div class="entry">
      {% autoescape false %}{{page.content }}{% endautoescape %}
    </div>
  </div>
</article>
{% endif %}

{% endblock %}