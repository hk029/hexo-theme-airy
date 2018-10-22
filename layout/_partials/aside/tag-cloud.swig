{% set tagsList = list_tags({ show_count: false }) %}
<div class="profile card">
    <div class="intro-box">
        <h1 class="title"><i class="{{theme.menu.Tags.icon}}"></i>{{_p('tag')}}</h1>
        {% if tagsList %}
        {% autoescape false %}{{ tagsList }}{% endautoescape %}
        {% else %}
        <p>{{ _p(None)}}.</p>
        {% endif %}
    </div>
</div>