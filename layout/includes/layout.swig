
{% set pageTitle = page.title || config.subtitle || '' %}

{% if is_archive() %}
  {% set pageTitle = 'Archives' %}
{% endif %}

{% if is_tag() %}
  {% set pageTitle = 'Tag: ' + page.tag %}
{% endif %}

{% if is_category() %}
  {% set pageTitle = 'Category: ' + page.category %}
{% endif %}

{% if is_month() %}
  {% set pageTitle = pageTitle + ': ' + page.month + '/' + page.year %}
{% endif %}

{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}

{% set pageTitle = pageTitle + ' [ ' + config.title + ' ]' %}

<!doctype html>
<html lang="{{ config.language }}">
<head>
  {% include '../_partials/head.swig' %}
</head>
<body>
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="inner">{% include '../_partials/header.swig' %}</div>
    </header>
    </div>

    <div class="content-outer">
      <div class="inner flex-container">
        {# {% autoescape false %}{{ body }}{% endautoescape %} #}
        {% block body %}{% endblock %}
      </div>
    </div>

  <div class="footer">
    <div class="inner">
      {% include '../_partials/footer.swig' %}
    </div>

    {% if theme.scripts !== undefined && theme.scripts.length > 0 %}
      {# scripts list from config.yml #}
      {% for url in theme.scripts %}
        <script src="{{ url }}"></script>
      {% endfor %}
    {% endif %}
    
    {% if is_post() && theme.postjs !== undefined && theme.postjs.length > 0 %}
    {# postjs list from config.yml #}
      {% for url in theme.postjs %}
      <script src="{{ url }}"></script>
      {% endfor %}
    {% endif %}
</body>
</html>
