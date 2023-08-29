import algoliasearch, { SearchClient, SearchIndex } from 'algoliasearch';
import { Hit } from '@algolia/client-search';
import { BaseWidget } from './base-widget';
import { FilterEvent, FilterItem, SearchEvents, SearchFacet, SearchItem } from '../interfaces/search';
import { Teaser } from '../interfaces/teaser';
import { mapToAlgoliaFilters, parseQuery } from '../helpers/search';

export class SearchResults extends BaseWidget {
    public static readonly NAME = 'search-results';

    private readonly searchClient: SearchClient;
    private readonly index: SearchIndex;
    private readonly searchResults: HTMLElement;
    private readonly tags: FilterItem[];

    constructor(element: HTMLElement) {
        super(element);

        this.searchClient = algoliasearch('5LXFM0O81Q', 'f961a95a00b2b2290054ad53fd75b424');
        this.index = this.searchClient.initIndex('cuelang.org');
        this.searchResults = document.getElementsByClassName('search__results').item(0) as HTMLElement;
        this.tags = this.element.dataset.tags ? JSON.parse(this.element.dataset.tags) : [];
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: SearchResults.NAME,
                load: SearchResults.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ SearchResults.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new SearchResults(element);
            newWidget.init();
        });
    }

    public init(): void {
        const url = new URL(window.location.href);
        const searchParams = new URLSearchParams(url.search);
        const query = searchParams.get('q');
        this.search(query);
    }

    public search(query: string): void {
        if (!query || query === '') {
            return;
        }

        const resultsNumber = this.element.querySelector<HTMLElement>('.search__amount') || undefined;
        const parsedQuery = parseQuery(query);
        const filters = mapToAlgoliaFilters(parsedQuery.facets);

        this.index
            .search<SearchItem>(parsedQuery.cleanQuery, {
                hitsPerPage: 100,
                filters: filters,
            })
            .then(results => {
                const teasers = results.hits.map(hit => this.mapSearchHitToTeaser(hit));

                if (resultsNumber) {
                    resultsNumber.classList.remove('is-hidden');
                    resultsNumber.insertAdjacentHTML('afterbegin', `<span>${ results.nbHits }<span> `);
                }

                if (teasers.length > 0) {
                    const teaserHtml = teasers.map(teaser => this.createTeaser(teaser));
                    this.searchResults.innerHTML = teaserHtml.join('');

                    const tagLinks = this.element.querySelectorAll<HTMLButtonElement>('button.tag');
                    tagLinks.forEach((link) => {
                        link.addEventListener('click', (e) => {
                            e.preventDefault();
                            this.handleTagClick(link.dataset.value);
                        });
                    });
                }
            });
    }

    public mapSearchHitToTeaser(hit: Hit<SearchItem>): Teaser {
        return {
            title: hit.title,
            link: hit.link,
            summary: hit._snippetResult.summary.value,
            breadcrumb: hit.breadcrumb,
            tags: (Array.isArray(hit.tags) ? hit.tags : [hit.tags]).filter(tag => tag),
        };
    }

    public createTeaser(teaser: Teaser): string {
        let tags = null;
        if (teaser.tags && teaser.tags.length) {
            tags = teaser.tags.map(tagString => this.tags.find(tag => tag.name === tagString));
        }

        return `
            <li class="list__item">
                <div class="teaser">
                    ${ (teaser.breadcrumb && teaser.breadcrumb.length > 0) ? `<div class="teaser__breadcrumb">
                        ${ teaser.breadcrumb.map(breadcrumb => `<span>${ breadcrumb }</span>`).join(' / ') }
                    </div>` : '' }
                    <div class="teaser__heading">
                        <h2 class="teaser__title">${ teaser.title }</h2>
                    </div>
                    ${ (teaser.summary) ? `<div class="teaser__excerpt">${ teaser.summary }</div>` : '' }
                    ${ (tags && tags.length) ? `<ul class="list list--tags teaser__tags">
                        ${ tags.map(tag => `<li class="list__item">
                            <button class="tag tag--${ tag.color }" data-value="${ tag.name }">${ tag.name }</button>
                        </li>`).join('') }
                    </ul>` : '' }
                    <a class="teaser__link" href="${ teaser.link }">
                        <span>Read more</span>
                    </a>
                </div>
            </li>
        `;
    }

    private handleTagClick(value: string) {
        document.dispatchEvent(
            new CustomEvent<FilterEvent>(SearchEvents.FILTER, {
                bubbles: true,
                detail: {
                    facet: SearchFacet.TAGS,
                    value: value,
                },
            })
        );
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    SearchResults.registerWidget();
    SearchResults.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        SearchResults.registerWidget();
        SearchResults.attachWidgetToElements(document);
    });
}
