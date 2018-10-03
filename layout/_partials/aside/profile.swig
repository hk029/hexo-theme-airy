{% set author = config.author %}
{% set introduce = theme.profile.introduce %}
{% set photo = theme.profile.photo.url %}
{% set round = theme.profile.photo.round %}

<div class="profile card">
    <div class="intro-box">
        <h1 class="title">{{_p('profile')}}</h1>
        <div class="avatar {% if round %} round {% endif %}" 
         style="background: url({{photo}}) 0 0 round">
         <img src="{{photo}}" alt="">
        </div>
        <div class="introduce">
        <div>            {{introduce}}</div>
        </div>
        <div class="author">{{author}}</div>
    </div>
</div>