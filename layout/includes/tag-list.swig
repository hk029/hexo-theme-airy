
{% set tagsList = list_tags({ show_count: false }) %}
        {% if tagsList %}
        {% autoescape false %}{{ tagsList }}{% endautoescape %}
        {% else %}
        <p>{{ _p(None)}}.</p>
        {% endif %}