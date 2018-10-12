{% extends 'includes/layout.swig' %}

{% block body %}
{% set categoriesList = list_categories({ show_count: false }) %}
{% set tagsList = list_tags({ show_count: false }) %}
{% set archivesList = list_archives({ show_count: true, format:'MM-YYYY', }) %}

{{ require('./transform.js') }}
{% if !is_year() %}
<div class="archive">
  <div class="flex-box">
    <div class="card flex tags">
      <h1 class="title"><i class="fas fa-tags"></i>&nbsp {{_p('Tags')}}</h1>
      {% if tagsList %}
      {% autoescape false %}{{ tagsList }}{% endautoescape %}
      {% else %}
      <p>{{ _p(None)}}.</p>
      {% endif %}
    </div>
    <div class="card flex categories">
      <h1 class="title"><i class="fas fa-th"></i>&nbsp {{_p('Categories')}}</h1>
      {% if categoriesList %}
      {% autoescape false %}{{ categoriesList }}{% endautoescape %}
      {% else %}
      <p>{{ _p(None)}}.</p>
      {% endif %}
    </div>
  </div>

    <div class="card timeline">
      <h1 class="title"><i class="fas fa-clock"></i>&nbsp {{_p('timeline')}}</h1>
      {% if archivesList %}
      {% autoescape false %}{{ archivesList.replace(RegExp('"archive-list-count">','g'),'"archive-list-count">' + _p('YouWrite') ) }}{% endautoescape %}
      {% else %}
      <p>{{ _p(None)}}.</p>
      {% endif %}

    </div>
    
</div>
{% else %}
<h1>{{ page.month + '/' + page.year }}</h1>
{% include 'includes/post-list.swig' %}
{% endif %}

{% endblock %}