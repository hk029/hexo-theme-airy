{{ algolia_search_config() }}  
<div class="card">
    <div class="search-bar">
        <span class="search-btn"></span>
        <div id="searchbox" class="search-box"></div>
        <div id="hits"></div>
        <div id="pagination"></div>
    </div>
</div>
{{js(['/assets/algolia/algoliasearchLite.min.js','/lib/instantsearch/instantsearch.js','/js/search.js']) }}