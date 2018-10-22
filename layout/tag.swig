{% extends 'includes/layout.swig' %}

{% block body %}
<div id="tag">
  <h1>{{ page.tag }}</h1>
  {% include 'includes/post-list.swig' %}
</div>
{% endblock %}