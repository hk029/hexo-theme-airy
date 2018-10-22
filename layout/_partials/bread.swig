{% set paths = page.path.split('/') %}
{% set count = paths.length %}
{% if count > 1 && !is_home()%}
{% set current = 0 %}
{% set link = '' %}
{% if count === 2%}
<ul class="breadcrumb nav">
  <li>{{titlecase(_p(paths[0])) }}</li>
</ul>
{% else %}
<ul class="breadcrumb">
  <i class="{{theme.menu.Home.icon}}"></i>
  <li><a href="/">{{ _p('index')}}</a></li>
  {% for path in paths %}
    {% autoescape false %}
    {% set current += 1 %}
    {% if path != 'index.html' %}
      {% if current == count - 1 %}
      <li>/{{titlecase(_p(path)) }}</li>
      {% elseif path != ''%}
      <li><a href="{{ link }}{{ url_for(path) }}/">/{{ _p(path) }}</a></li>
        {% if link == '' %}
        {% set link = '/' + path %}
        {% else %}
        {% set link += '/' + path %}
        {% endif %}
      {% endif %}
    {% endif %}
  {% endautoescape %}
  {% endfor %}
</ul>
{%endif%}
{% endif %}