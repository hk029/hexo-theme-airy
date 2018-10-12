<div class="time">
    {% if postItem.date %}
    <time datetime="{{ postItem.date.toJSON() }}">
        {{ date(postItem.date) }}
    </time>
    {% endif %}
</div>
<h1 class="post-title">{{ postItem.title }}</h1>
<div class="more-info">
   {% if postItem.categories.length > 0%} 
    <i class="fas fa-th"></i>
    <span class="post-category">
        {% for category in postItem.categories %}
        <a href="{{ url_for(category.path) }}">{{ category.name }}</a>
        {% endfor %}
    </span>
    {%endif%}
    {% if postItem.categories.length > 0%} 
    <i class="fas fa-tags" style="margin-left:10px"></i>
    <span class="post-tags">
        {% for tag in postItem.tags %}
        <a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
        {% endfor %}
    </span>
    {%endif%}
</div>