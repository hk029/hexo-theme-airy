{% set subtitle = config.subtitle %}
{% set categories = list_categories({depth: 1, show_count: false}) %}
{% set title = config.title %}
<div class="site-brand-wrapper">
    <div class="site-meta">
        <div class="custom-logo-site-title">
            {% if theme.custom_logo.enabled %}
            <a>
                <img class="custom-logo-image" src="{{ theme.custom_logo.image }}" alt="{{ title }}" />
            </a>
            {% else %}
            <a href="{{ config.root }}" class="brand" rel="start">
                <span class="site-title">{{ title }}</span>
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
            {% set title = key %}
            <span class="menu-item">
                {% if theme.menu[key].icon %}
                <i class="fas fa-{{ theme.menu[key].icon}}"></i>
                {% endif %}
                {% if title == "Categories" %}
                <div class="category-menu" href="">
                {{ _p(title) }}
                    <div class="category-panel">
                    <div class="triangle"></div>
                    {{categories}}
                    </div>
                </div>
                {% else %}
                <a href="{{ theme.menu[key].url }}">{{ _p(title) }}</a>
                {% endif %}
            </span>
            {% endfor %}
        </div>
    </div>
</div>