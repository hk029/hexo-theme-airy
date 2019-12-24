{{ algolia_search_config() }}  
<div class="card">
    <div class="search-bar">
        <span class="search-btn"></span>
        <div id="searchbox" class="search-box"></div>
        <div id="hits"></div>
        <div id="pagination"></div>
    </div>
</div>
{{js(['/lib/jquery/jquery.min.js','https://cdnjs.cloudflare.com/ajax/libs/algoliasearch/3.35.1/algoliasearch.min.js','/lib/instantsearch/instantsearch.js','/js/search.js']) }}