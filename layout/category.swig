{% extends 'includes/layout.swig' %}

{% block body %}
  <div class="cat-title">
    <h1><i class="fas fa-folder-open"></i> {{ page.category }}</h1>
  </div>
  <div class="right">
    {% include '_partials/aside/category.swig' %}
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
