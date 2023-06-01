import algoliasearch, { SearchClient, SearchIndex } from 'algoliasearch';
import { Hit } from '@algolia/client-search';
import { BaseWidget } from './base-widget';
import { SearchItem } from '../interfaces/search';
import { Teaser } from '../interfaces/teaser';

export class SearchResults extends BaseWidget {
    public static readonly NAME = 'search-results';

    private readonly searchClient: SearchClient;
    private readonly index: SearchIndex;
    private readonly searchResults: HTMLElement;

    constructor(element: HTMLElement) {
        super(element);

        this.searchClient = algoliasearch('5LXFM0O81Q', 'f961a95a00b2b2290054ad53fd75b424');
        this.index = this.searchClient.initIndex('cuelang.org');
        this.searchResults = document.getElementsByClassName('search').item(0) as HTMLElement;
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

        const resultsNumber = this.element.querySelector<HTMLElement>('.searchbar__results') || undefined;

        this.index
            .search<SearchItem>(query, {
                hitsPerPage: 100,
            })
            .then(results => {
                const teasers = results.hits.map(hit => this.mapSearchHitToTeaser(hit));

                if (resultsNumber) {
                    resultsNumber.classList.remove('is-hidden');
                    resultsNumber.insertAdjacentHTML('afterbegin', `<span>${ results.nbHits }<span> `);
                }

                if (teasers.length > 0) {
                    teasers.forEach(teaser => {
                        return this.searchResults.insertAdjacentHTML('beforeend', this.createTeaser(teaser));
                    });
                }
            });
    }

    public mapSearchHitToTeaser(hit: Hit<SearchItem>): Teaser {
        return {
            title: hit._highlightResult.title.value,
            link: hit.link,
            categories: hit.categories,
            summary: hit._snippetResult.summary.value,
        };
    }

    public createTeaser(teaser: Teaser): string {
        return `
            <div class="teaser teaser--search">
                <h2 class="teaser__title">${ teaser.title }</h2>
                ${ (teaser.categories && teaser.categories.length > 0) ?
                    `<div class="teaser__meta">${ typeof teaser.categories === 'string'
                        ? teaser.categories
                        : teaser.categories.join(', ') }</div>` :
                    ''
                }
                ${ (teaser.summary) ?
                    `<div class="teaser__excerpt">${ teaser.summary }</div>` :
                    ''
                }
                <a class="teaser__link" href="${ teaser.link }">
                    <span>Read more</span>
                </a>
            </div>
        `;
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
