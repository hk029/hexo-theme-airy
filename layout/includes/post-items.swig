<div class="time">
    <span class="post-category">
        {% for category in postItem.categories %}
        <a href="{{ url_for(category.path) }}">{{ category.name }}</a>
        {% endfor %}
    </span>
    <span class="post-tags">
        {% for tag in postItem.tags %}
        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
        {% endfor %}
    </span>

    {% if postItem.date %}
    <time datetime="{{ postItem.date.toJSON() }}">
        {{ date(postItem.date) }}
    </time>
    {% endif %}
</div>
<h1 class="post-title">{{ postItem.title }}</h1>