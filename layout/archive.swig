{% extends 'includes/layout.swig' %}

{% block body %}
{% set categoriesList = list_categories({ show_count: true }) %}
{% set tagsList = list_tags({ show_count: false }) %}
{% set archivesList = list_archives({ show_count: true, format:'MM-YYYY', }) %}

{{ require('./transform.js') }}
{% if !is_year() %}
<div class="archive">
  <div class="flex-box">
    <div class="card flex timeline">
      <h1 class="title"><i class="fas fa-clock"></i>&nbsp {{_p('timeline')}}</h1>
      {% if archivesList %}
      {% autoescape false %}{{ archivesList.replace(RegExp('"archive-list-count">','g'),'"archive-list-count">' + _p('YouWrite') ) }}{% endautoescape %}
      {% else %}
      <p>{{ _p(None)}}.</p>
      {% endif %}
    </div>

    <div class="flex">

    <div class="card flex tags flex-row">
        <h1 class="title"><i class="fas fa-tags"></i>&nbsp {{_p('Tags')}}</h1>
    {% include 'includes/tag-list.swig'%}
    </div>
    </div>
  </div>

    
</div>
{% else %}
<h1>{{ page.month + '/' + page.year }}</h1>
{% include 'includes/post-list.swig' %}
{% endif %}

{% endblock %}