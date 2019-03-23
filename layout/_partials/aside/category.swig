{% set categoriesList = list_categories({ show_count: true }) %}
<div class="profile card">
    <div class="intro-box">
        <h1 class="title"><i class="{{theme.menu.Tags.icon}}"></i>{{_p('categories')}}</h1>
        {% if categoriesList %}
        {% autoescape false %}{{ categoriesList }}{% endautoescape %}
        {% else %}
        <p>{{ _p(None)}}.</p>
        {% endif %}
    </div>
</div>