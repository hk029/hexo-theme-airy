(function(window) {
    const { config } = window;
    const { algolia } = config;

    const search = instantsearch({
        indexName: algolia.indexName,
        searchClient: algoliasearch(algolia.applicationID, algolia.apiKey)
    });

    search.addWidget(
        instantsearch.widgets.searchBox({
            container: '#searchbox',
            placeholder: '请输入查询关键词',
            showSubmit: true,
            autofocus: true,
            searchAsYouType: false
            // showLoadingIndicator: true
        })
    );

    search.addWidget(
        instantsearch.widgets.hits({
            container: '#hits',
            templates: {
                item(hit) {
                    const { slug, title, date, tags, _highlightResult } = hit;
                    const hltags = _highlightResult.tags
                        ? _highlightResult.tags.map(tag => tag.name.value)
                        : [];
                    return `
          <a href="/${slug}">
            <div class="hit-title">
            ${_highlightResult.title.value}
            </div>
            <div >
              ${hltags.map(v => `<span class="hit-tags" >${v}</span>`)}
            </div>
            <div class="hit-date">
            ${date.substr(0, 10)}
            </div>
          </a>
        `;
                }
            }
        })
    );

    search.addWidget(
        instantsearch.widgets.pagination({
            container: '#pagination'
        })
    );

    search.start();
})(window);
