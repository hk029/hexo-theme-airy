{% extends 'includes/layout.swig' %}

{% block body %}
<div class="right">
  {% include '_partials/aside/profile.swig' %}
  {% include '_partials/aside/tag-cloud.swig' %}
  {% include '_partials/aside/recent-posts.swig' %}
</div>
<div class="left">
  {% include 'includes/post-list.swig' %}
  <div class="card">
    {% include "./_partials/pagination.swig" %}
  </div>
</div>

{% endblock %}