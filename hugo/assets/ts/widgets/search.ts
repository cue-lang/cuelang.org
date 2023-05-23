import algoliasearch, { SearchClient, SearchIndex } from 'algoliasearch';
import { Hit } from '@algolia/client-search';
import { BaseWidget } from './base-widget';
import { SearchItem } from '../interfaces/search';
import { Teaser } from '../interfaces/teaser';

export class Search extends BaseWidget {
    public static readonly NAME = 'search';

    private readonly client: SearchClient;
    private readonly index: SearchIndex;
    private readonly searchResults: HTMLElement;
    private readonly url!: URL;

    constructor(element: HTMLElement) {
        super(element);

        this.client = algoliasearch('5LXFM0O81Q', 'f961a95a00b2b2290054ad53fd75b424');
        this.index = this.client.initIndex('cuelang.org');
        this.searchResults = document.getElementsByClassName('search').item(0) as HTMLElement;
        this.url = new URL(window.location.href);
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Search.NAME,
                load: Search.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Search.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Search(element);
            newWidget.init();
        });
    }

    public init(): void {
        const searchParams = new URLSearchParams(this.url.search);
        const searchQuery = searchParams.get('q');

        if (searchQuery) {
            this.search(searchQuery);
        }
    }

    public search(query: string, pageNr = 1): void {
        const pageIndex = pageNr - 1;
        const resultsNumber = this.element.querySelector<HTMLInputElement>('.searchbar__results');
        const searchInput = this.element.querySelector<HTMLInputElement>('#searchbar');
        searchInput.value = query;

        this.index
            .search<SearchItem>(query, {
                hitsPerPage: 100,
                page: pageIndex,
            })
            .then(results => {
                const teasers = results.hits.map(hit => this.mapSearchHitToTeaser(hit));

                resultsNumber.classList.remove('is-hidden');
                resultsNumber.insertAdjacentHTML('afterbegin', `<span>${ results.nbHits }<span> `);

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
    Search.registerWidget();
    Search.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Search.registerWidget();
        Search.attachWidgetToElements(document);
    });
}
