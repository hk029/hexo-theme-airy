{% set author = config.author %}
{% set introduce = theme.profile.introduce %}
{% set photo = theme.profile.photo.url %}
{% set round = theme.profile.photo.round %}
{% set social = theme.social %}

<div class="profile card">
    <div class="intro-box">
        <h1 class="title"><i class="{{theme.menu.About.icon}}"></i>&nbsp {{_p('profile')}}</h1>
        <div class="avatar {% if round %} round {% endif %}">
         <img src="{{photo}}" alt="">
        </div>
        <div class="introduce">
        <div>            {{introduce}}</div>
        </div>
        <div class="author">{{author}}</div>
        <div class="social flex-box">
            {% for item in social%}
            {% if item.enable %}
            <div class="social-item flex">
                {% if item.qrcode %}
                <a data-fancybox="gallery" href="{{item.url}}">
                <i class="{{item.icon}}"></i>
                </a>
                <!-- <div class="qrcode">
                </div> -->
                {% else %}
                <a href="{{item.url}}" target="_blank">
                <i class="{{item.icon}}"></i>
                </a>
                {% endif %}
            </div>
            {% endif %}
            {% endfor %}
        </div>
    </div>
</div>