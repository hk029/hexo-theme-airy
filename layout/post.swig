{% extends 'includes/layout.swig' %}

{% block body %}
<article id="post">
  <div class="right">
    {% include "./_partials/_post/toc.swig" %}
  </div>
  <div class="left">
    <div class="card">
      <div class="entry" data-scroll>
        <h1>
          {{page.title}}
        </h1>
        {{page.content}}
      </div>
    </div>
    <div class="card">
      {% include "./_partials/pagination.swig" %}
    </div>
  </div>
</article>
{% endblock %}