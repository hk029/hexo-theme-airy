{% extends 'includes/layout.swig' %}

{% block body %}
  <article id="post">
    <div class="right">
    {% include "./_partials/toc.swig" %}
    </div>
    <div class="left">
    {% include "./_partials/posts.swig" %}
    </div>
  </article>
{% endblock %}
