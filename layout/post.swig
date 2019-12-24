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
        {% include "./_partials/_post/copyright.swig" %}
      </div>
    </div>
    <div class="card">
      {% include "./_partials/pagination.swig" %}
    </div>
     <div class="card">
        <div id="vcomments" class="vcomments">
        </div>
    </div>
  </div>
</article>
{{js(['/lib/jquery/jquery.min.js','/lib/fancybox/fancybox.min.js', '/js/scrollspy.js']) }}
{{js(['//cdn1.lncld.net/static/js/3.0.4/av-min.js','//unpkg.com/valine/dist/Valine.min.js']) }}
  <script>
        new Valine({
            notify: true, // 邮件提醒!!!
            verify: false,
            placeholder: '有什么想法？来跟我聊聊吧，这个编辑框是支持markdown语法的哦',
            el: '#vcomments',
            appId: 'etSYYBxw13C0hiiKKpGNNX2q-9Nh9j0Va',
            appKey: 'HVNgFcNu6qCxdVIfwkJNeGeL'
        })
    </script>
{% endblock %}
