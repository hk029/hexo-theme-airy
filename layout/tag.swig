{% extends 'includes/layout.swig' %}

{% block body %}
<div id="tag">
  <div class="cat-title">
    <h1># {{ page.tag }}</h1>
  </div>
  <div class="right">
    {% include '_partials/aside/tag-cloud.swig' %}
  </div>
  <div class="left">
    <div class="categry">
        {% include 'includes/post-list.swig' %}
    </div>
    <div class="card">
        {% include "./_partials/pagination.swig" %}
    </div>
  </div>
{% endblock %}