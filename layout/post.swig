{% extends 'includes/layout.swig' %}

{% block body %}
<article class="post">
  <div class="right">
    {% include "./_partials/_post/toc.swig" %}
  </div>
  <div class="left">
    <div class="card">
      <div class="entry" data-scroll>
      <div class="post-head">
        <h1>
          {{page.title}}
        </h1>
        <div class="detail">
            <span class="post-count"><i class="fas fa-calendar"></i> {{ date(page.date) }} &nbsp;&nbsp;|&nbsp;&nbsp;</span>
            <span class="post-count">       
                <i class="fas fa-folder-open"></i> {% if page.categories.length > 0%} 
                <span class="post-category">
                    {% for category in page.categories %}
                    <a href="{{ url_for(category.path) }}">{{ category.name }}</a>
                    {% endfor %}
                </span>
                {%endif%}
            </span>
            <span class="post-count">&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fas fa-poll"></i> {{ wordcount(post.content) }}</span>
            <span class="post-count">&nbsp;&nbsp;|&nbsp;&nbsp;<i class="fas fa-poll"></i> {{ min2read(page.content, {cn: 300, en: 160}) }}</span>
        </div>
        </div>

        {{fancybox(page.content)}}
      </div>
    </div>
    <div class="card">
      {% include "./_partials/pagination.swig" %}
    </div>
  </div>
</article>
{% endblock %}