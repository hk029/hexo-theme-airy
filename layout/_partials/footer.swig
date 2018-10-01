{% set author = config.author %}
<div class="copyright">
  Copyright
  {% set current = date(Date.now(),'YYYY') %}
  &copy;
  {% if theme.footer.since and theme.footer.since != current %}
  {{ theme.footer.since }} –
  {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright or author }}</span>
  <div class='host'>
    {{_p('footer.host', '<a href="https://pages.github.com/" target="_blank">GitHub Pages</a>')}}
  </div>
  <div class="power">
    {{_p('footer.powered', '<a href="https://hexo.io" target="_blank">Hexo</a>')}}
    |
    {{_p('footer.theme', '<a href="https://github.com/hk029/hexo-theme-airy/" target="_blank">Age</a>')}}
  </div>
</div>