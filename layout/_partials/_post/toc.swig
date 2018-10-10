<div class="card post-toc">
    <h1 class="title">文章目录</h1>
    <div>

        {% if page.toc_number === undefined %}
        {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
        {% else %}
        {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
        {% endif %}

        {% if toc.length <= 1 %} <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
            <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

    </div>
</div>