{% extends 'includes/layout.swig' %}
{% set categoriesList = list_categories({ show_count: false }) %}
{% block body %}
{% if page.title == 'categoriesgs'%}
<div class="card h340">
  {% if categoriesList %}
  {% autoescape false %}
  {{categoriesList}}
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