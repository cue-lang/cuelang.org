/* eslint-disable object-shorthand */
/* eslint-disable max-lines-per-function */
/* eslint-disable prefer-arrow/prefer-arrow-functions */
import algoliasearch, { SearchClient } from 'algoliasearch';
import { autocomplete, AutocompletePlugin, getAlgoliaResults, VNode } from '@algolia/autocomplete-js';
import { createQuerySuggestionsPlugin } from '@algolia/autocomplete-plugin-query-suggestions';
import { AutocompleteQuerySuggestionsHit } from '@algolia/autocomplete-plugin-query-suggestions/dist/esm/types';
import { AutocompleteApi } from '@algolia/autocomplete-js/dist/esm/types';
import { BaseItem, OnSubmitParams } from '@algolia/autocomplete-shared/dist/esm/core';
import { BaseWidget } from './base-widget';

export class SearchAutocomplete extends BaseWidget {
    public static readonly NAME = 'search-autocomplete';

    private readonly searchClient: SearchClient;
    private readonly suggestionsClient: SearchClient;
    private readonly searchType: string;
    private readonly searchbarSize: string;
    private querySuggestionsPlugin: AutocompletePlugin<AutocompleteQuerySuggestionsHit, undefined>;
    private autocomplete: AutocompleteApi<BaseItem>;

    constructor(element: HTMLElement) {
        super(element);

        this.searchClient = algoliasearch('5LXFM0O81Q', 'f961a95a00b2b2290054ad53fd75b424');
        this.suggestionsClient = algoliasearch('5LXFM0O81Q', '6f93ecdc1bf190af31a69b04a21a38b8');
        this.searchType = this.element.dataset.searchAutocomplete || '';
        this.searchbarSize = this.element.dataset.searchbarSize;
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: SearchAutocomplete.NAME,
                load: SearchAutocomplete.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ SearchAutocomplete.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new SearchAutocomplete(element);
            newWidget.init();
        });
    }

    public init(): void {
        this.initQuerySuggestions();
        this.initAutocompleteSearch(this.searchClient, this.searchType);

        // Prefill autocomplete with query from url on search results page
        if (this.searchType === 'results') {
            const url = new URL(window.location.href);
            const searchParams = new URLSearchParams(url.search);
            const query = searchParams.get('q');
            if (query && query !== '') {
                this.autocomplete.setQuery(query);
            }
        }

        document.addEventListener('click', (e) => {
            if (!this.element.contains(e.target as HTMLElement)) {
                this.autocomplete.setIsOpen(false);

                // Reset query to empty on all autocomplete except search results page
                if (this.searchType !== 'results') {
                    this.autocomplete.setQuery('');
                }
            }
        });
    }

    public initQuerySuggestions() {
        this.querySuggestionsPlugin = createQuerySuggestionsPlugin({
            searchClient: this.suggestionsClient,
            indexName: 'cuelang.org_query_suggestions',
            transformSource({ source }) {
                function createUrl(item: AutocompleteQuerySuggestionsHit) {
                    return `/search?q=${ item.query.toString() }`;
                }

                return {
                    ...source,
                    getItemUrl({ item }) {
                        return createUrl(item);
                    },
                    templates: {
                        ...source.templates,
                        header({ state, html }) {
                            if (state.query) {
                                return null;
                            }

                            return html`
                                <span class="aa-SourceHeaderTitle searchbar__header-title">Popular searches</span>
                                <div class="aa-SourceHeaderLine searchbar__header-line"></div>
                            `;
                        },
                        item(params) {
                            const { item, html } = params;

                            return html`
                                <a class="aa-ItemLink" href="${ createUrl(item) }">
                                    ${ (source.templates.item(params) as VNode).props.children }
                                </a>
                            `;
                        },
                    },
                };
            },
        });
    }

    public initAutocompleteSearch(searchClient: SearchClient, searchType: string) {
        this.autocomplete = autocomplete({
            container: `#autocomplete-${ searchType }`,
            plugins: [this.querySuggestionsPlugin],
            detachedMediaQuery: '(max-width: 1023px)',
            openOnFocus: this.searchType === 'results',
            getSources() {
                return [{
                    sourceId: 'documentation',
                    getItemInputValue({ item }) {
                        return item.title.toString();
                    },
                    getItems({ query }) {
                        return getAlgoliaResults({
                            searchClient,
                            queries: [{
                                indexName: 'cuelang.org',
                                query,
                                params: {
                                    hitsPerPage: 5,
                                    attributesToSnippet: ['title:6', 'summary:25'],
                                    snippetEllipsisText: '…',
                                },
                            }],
                        });
                    },
                    getItemUrl({ item }) {
                        return item.link.toString();
                    },
                    templates: {
                        header({ html }) {
                            return html`
                                <span class="aa-SourceHeaderTitle searchbar__header-title">Search results</span>
                                <div class="aa-SourceHeaderLine searchbar__header-line"></div>
                            `;
                        },
                        item({ item, components, html }) {
                            function htmlDecode(input: string, length = 100) {
                                const doc = new DOMParser().parseFromString(input, 'text/html');
                                const content = doc.documentElement.textContent;

                                if (content.length <= length) {
                                    return content;
                                }

                                return content.substring(0, length).trim() + '\u2026';
                            }

                            return html`
                                <a class="searchbar__item" href="${ item.link }">
                                    <div class="searchbar__item-content">
                                        <h2 class="searchbar__item-title">
                                            ${ components.Highlight({
                                                hit: item,
                                                attribute: 'title',
                                            }) }
                                        </h2>

                                        <p class="searchbar__item-description">
                                            ${ htmlDecode(item.summary.toString()) }
                                        </p>
                                    </div>
                                </a>
                            `;
                        },
                        noResults() {
                            return 'No results found.';
                        },
                    },
                }];
            },
            navigator: {
                navigate({ itemUrl }) {
                    window.location.assign(itemUrl);
                },
                navigateNewTab({ itemUrl }) {
                    const windowReference = window.open(itemUrl, '_blank', 'noopener');

                    if (windowReference) {
                        windowReference.focus();
                    }
                },
                navigateNewWindow({ itemUrl }) {
                    window.open(itemUrl, '_blank', 'noopener');
                },
            },
            onSubmit(params: OnSubmitParams<BaseItem>) {
                window.location.href = `/search?q=${ params.state.query }`;
            },
            classNames: {
                detachedCancelButton: '',
                detachedFormContainer: 'searchbar__form-container',
                detachedContainer: 'searchbar__container',
                detachedOverlay: 'searchbar__overlay',
                detachedSearchButton: 'searchbar__form searchbar__form--detached',
                detachedSearchButtonIcon: '',
                detachedSearchButtonPlaceholder: '',
                form: 'searchbar__form',
                input: 'searchbar__input',
                inputWrapper: '',
                inputWrapperPrefix: 'searchbar__prefix',
                inputWrapperSuffix: 'searchbar__suffix',
                item: 'searchbar__list-item',
                label: 'searchbar__label',
                list: 'searchbar__list',
                loadingIndicator: '',
                panel: 'searchbar__panel',
                panelLayout: 'searchbar__panel-layout',
                clearButton: '',
                root: `searchbar${ this.searchbarSize === 'small' ? ' searchbar--small' : '' }`,
                source: '',
                sourceFooter: '',
                sourceHeader: '',
                submitButton: `button button--icon searchbar__button${ this.searchbarSize === 'small' ? ' button--small' : '' }`,
            },
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    SearchAutocomplete.registerWidget();
    SearchAutocomplete.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        SearchAutocomplete.registerWidget();
        SearchAutocomplete.attachWidgetToElements(document);
    });
}
