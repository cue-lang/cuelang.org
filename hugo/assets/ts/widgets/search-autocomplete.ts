import { autocomplete, AutocompletePlugin, getAlgoliaResults, GetSources, VNode } from '@algolia/autocomplete-js';
import { AutocompleteApi } from '@algolia/autocomplete-js/dist/esm/types';
import { createQuerySuggestionsPlugin } from '@algolia/autocomplete-plugin-query-suggestions';
import { AutocompleteQuerySuggestionsHit } from '@algolia/autocomplete-plugin-query-suggestions/dist/esm/types';
import { BaseItem, GetSourcesParams, OnSubmitParams } from '@algolia/autocomplete-shared/dist/esm/core';
import algoliasearch, { SearchClient } from 'algoliasearch';
import merge from 'lodash.merge';
import { getHiddenInputFacets, mapToAlgoliaFilters, parseQuery } from '../helpers/search';
import { SearchFacets, SearchItem } from '../interfaces/search';
import { BaseWidget } from './base-widget';

/* eslint-disable max-lines-per-function */
export class SearchAutocomplete extends BaseWidget {
    public static readonly NAME = 'search-autocomplete';

    private isOpen = false;
    private readonly searchClient: SearchClient;
    private readonly suggestionsClient: SearchClient;
    private readonly searchType: string;
    private readonly searchbarSize: string;
    private querySuggestionsPlugin: AutocompletePlugin<AutocompleteQuerySuggestionsHit, undefined>;
    private autocomplete: AutocompleteApi<BaseItem>;
    private readonly placeholder: string;
    private readonly detachedModeMaxWidth = 1023;
    private readonly facetInputs: NodeListOf<HTMLInputElement>;

    constructor(element: HTMLElement) {
        super(element);

        this.searchClient = algoliasearch('5LXFM0O81Q', 'f961a95a00b2b2290054ad53fd75b424');
        this.suggestionsClient = algoliasearch('5LXFM0O81Q', '6f93ecdc1bf190af31a69b04a21a38b8');
        this.searchType = this.element.dataset.searchAutocomplete || '';
        this.searchbarSize = this.element.dataset.searchbarSize;
        this.placeholder = this.element.dataset.searchbarPlaceholder ?? '';
        this.facetInputs = document.querySelectorAll<HTMLInputElement>('[data-search-results] input[name^="facet-"]');
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
            const query = searchParams.get('q') || '';
            if (query && query !== '') {
                this.autocomplete.setQuery(query);
            }
        }

        document.addEventListener('click', (e) => {
            this.handleDocumentClick(e);
        });
    }

    public initQuerySuggestions() {
        this.querySuggestionsPlugin = createQuerySuggestionsPlugin({
            searchClient: this.suggestionsClient,
            indexName: 'cuelang.org_query_suggestions',
            transformSource: ({ source }) => {
                return {
                    ...source,
                    getItemUrl: ({ item }) => {
                        return this.getSearchUrl(item.query.toString());
                    },
                    templates: {
                        ...source.templates,
                        header: ({ state, html }) => {
                            if (state.query) {
                                return null;
                            }

                            return html`
                                <span class="aa-SourceHeaderTitle searchbar__header-title">Popular searches</span>
                                <div class="aa-SourceHeaderLine searchbar__header-line"></div>
                            `;
                        },
                        item: (params) => {
                            const { item, html } = params;

                            return html`
                                <a class="aa-ItemLink" href="${ this.getSearchUrl(item.query.toString()) }">
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
        this.autocomplete = autocomplete<SearchItem>({
            initialState: undefined,
            insights: undefined,
            container: `#autocomplete-${ searchType }`,
            plugins: [this.querySuggestionsPlugin],
            detachedMediaQuery: `(max-width: ${ this.detachedModeMaxWidth }px)`,
            openOnFocus: this.searchType === 'results',
            placeholder: this.placeholder,
            getSources: ((_params: GetSourcesParams<SearchItem>) => {
                return [{
                    sourceId: 'documentation',
                    getItemInputValue: ({ item }) => {
                        return item.title.toString();
                    },
                    getItems: ({ query }) =>{
                        const parsedQuery = parseQuery(query);
                        const facetsFromInputs = this.getHiddenInputFacets();
                        const facets = merge(parsedQuery.facets, facetsFromInputs);
                        const filters = mapToAlgoliaFilters(facets);

                        return getAlgoliaResults({
                            searchClient: searchClient,
                            queries: [{
                                indexName: 'cuelang.org',
                                query: parsedQuery.cleanQuery,
                                params: {
                                    hitsPerPage: 5,
                                    attributesToSnippet: ['title:6', 'summary:30'],
                                    snippetEllipsisText: '…',
                                    filters: filters,
                                },
                            }],
                        });
                    },
                    getItemUrl: ({ item }) => {
                        return item.link.toString();
                    },
                    templates: {
                        header: ({ html }) => {
                            return html`
                                <span class="aa-SourceHeaderTitle searchbar__header-title">Search results</span>
                                <div class="aa-SourceHeaderLine searchbar__header-line"></div>
                            `;
                        },
                        item: ({ item, html }) => {
                            return html`
                                <a class="searchbar__item" href="${ item.link }">
                                    <div class="searchbar__item-content">
                                        ${ ((item.breadcrumb as SearchItem['breadcrumb']) &&
                                        (item.breadcrumb as SearchItem['breadcrumb']).length >= 0) ? html`
                                            <div class="searchbar__breadcrumb">
                                                ${ (item.breadcrumb as SearchItem['breadcrumb']).map((breadcrumb: string) => html`
                                                    <span>${ breadcrumb }</span>
                                                `) }
                                            </div>
                                        ` : '' }

                                        <h2 class="searchbar__item-title">
                                            ${ this.htmlDecode(item.title.toString()) }
                                        </h2>

                                        <p class="searchbar__item-description">
                                            ${ this.htmlDecode(item.summary.toString()) }
                                        </p>
                                    </div>
                                </a>
                            `;
                        },
                        noResults: () => {
                            return 'No results found.';
                        },
                    },
                }];
            }) as GetSources<SearchItem>,
            navigator: {
                navigate: ({ itemUrl }) => {
                    window.location.assign(itemUrl);
                },
                navigateNewTab: ({ itemUrl }) => {
                    const windowReference = window.open(itemUrl, '_blank', 'noopener');

                    if (windowReference) {
                        windowReference.focus();
                    }
                },
                navigateNewWindow: ({ itemUrl }) => {
                    window.open(itemUrl, '_blank', 'noopener');
                },
            },
            onSubmit: (params: OnSubmitParams<BaseItem>) => {
                if (searchType === 'results') {
                    window.location.href = `?q=${ params.state.query }`;
                } else {
                    window.location.href = `/search?q=${ params.state.query }`;
                }
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
            onStateChange: (props) => {
                this.isOpen = props.state.isOpen;
            },
        });
    }

    private handleDocumentClick(e: MouseEvent) {
        const target = (e.target as HTMLElement);
        const overlay = document.getElementsByClassName('searchbar__overlay').item(0);

        if (this.isOpen && !this.element.contains(target) && !(overlay && overlay.contains(target))) {
            this.autocomplete.setIsOpen(false);

            /* Reset query to empty when closing except on the search results searchbar */
            if (this.searchType !== 'results') {
                this.autocomplete.setQuery('');
            }
        }
    }

    private getHiddenInputFacets(): SearchFacets {
        if (!this.facetInputs) {
            return {};
        }
        return getHiddenInputFacets(this.facetInputs);
    }

    private getSearchUrl(query?: string): string {
        const hasWidget = document.querySelector<HTMLInputElement>('[data-search-results]');
        const isSearchWidget = this.searchType === 'results' && hasWidget;
        let url = isSearchWidget ? window.location.pathname : '/search';
        if (query) {
            url += `?q=${ query }`;
        }
        return url;
    }

    private htmlDecode(input: string, length = 100) {
        const doc = new DOMParser().parseFromString(input, 'text/html');
        const content = doc.documentElement.textContent;

        if (content.length <= length) {
            return content;
        }

        return content.substring(0, length).trim() + '\u2026';
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
