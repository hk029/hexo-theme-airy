{% set subtitle = config.subtitle %}
{% set title = config.title %}
<div class="site-brand-wrapper">
    <div class="site-meta">
        <div class="custom-logo-site-title">
            {% if theme.custom_logo.image %}
            <a>
                <img class="custom-logo-image" src="{{ theme.custom_logo.image }}" alt="{{ title }}" />
            </a>
            {% else %}
            <a href="{{ config.root }}" class="brand" rel="start">
                <span class="logo-line-before"><i></i></span>
                <span class="site-title">{{ title }}</span>
                <span class="logo-line-after"><i></i></span>
            </a>
            {% endif %}
        </div>
        {% if subtitle %}
        {% if theme.seo %}
        <h1 class="site-subtitle" itemprop="description">{{ subtitle }}</h1>
        {% else %}
        <p class="site-subtitle">{{ subtitle }}</p>
        {% endif %}
        {% endif %}
    </div>
    <div clas="nav-menu">
        <div class="menu-inner">
            {% for key in Object.keys(theme.menu) %}
            {% set title = 'menu.' + key %}
            <a href="{{ theme.menu[key] }}">{{ _p(title) }}</a>
            {% endfor %}
        </div>
    </div>
</div>