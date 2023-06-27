import Fuse from 'fuse.js';
import { BaseWidget } from './base-widget';
import { FilterEvent, FilterItem, ParsedQuery, SearchEvents } from '../interfaces/search';
import { parseQuery, queryToUrlParams } from '../helpers/search';

export class SearchFilter extends BaseWidget {
    public static readonly NAME = 'filter';

    private readonly filterName: string;
    private readonly listContainer: Element;
    private readonly input: HTMLInputElement;

    private readonly items: FilterItem[];
    private filteredItems: FilterItem[];
    private selectedItems: string[];
    private parsedQuery: ParsedQuery;
    private fuse: Fuse<FilterItem>;

    constructor(element: HTMLElement) {
        super(element);

        this.filterName = this.element.dataset.filter;
        this.items = this.element.dataset.filterItems ? JSON.parse(this.element.dataset.filterItems) : [];
        this.filteredItems = this.items;
        this.listContainer = this.element.getElementsByClassName('filter__list').item(0);
        this.input = this.element.getElementsByClassName('filter__input').item(0) as HTMLInputElement;
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: SearchFilter.NAME,
                load: SearchFilter.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ SearchFilter.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new SearchFilter(element);
            newWidget.init();
        });
    }

    public init(): void {
        const options = {
            keys: ['name'],
            threshold: 0.4,
        };
        this.fuse = new Fuse(this.items, options);

        this.getParamsFromUrl();
        this.searchList();
        this.initListeners();
        this.element.classList.remove('is-loading');
    }

    public initListeners(): void {
        this.input.addEventListener('keyup', this.searchList.bind(this));

        document.addEventListener(SearchEvents.FILTER, (e: CustomEvent<FilterEvent>) => {
            if (e.detail.facet === this.filterName) {
                this.onClickFilter(e.detail.value);
            }
        });
    }

    public searchList(): void {
        const value = this.input.value;
        if (value && value !== '') {
            this.filteredItems = this.fuse.search(value).map(result => result.item);
        } else {
            this.filteredItems = this.items;
        }

        this.renderList();
    }

    public renderList(): void {
        const html = this.filteredItems.map((item) => {
            const isSelected = this.selectedItems.includes(item.name);
            return `<li class="filter__item">
                <button class="filter__link${ isSelected ? ' is-selected' : '' }"
                type="button" data-value="${ item.name }">
                    ${ item.color ? `<span class="filter__color filter__color--${ item.color }"></span>` : ''}
                    ${ item.name }
                </button>
            </li>`;
        });

        this.listContainer.innerHTML = html.join('');

        const filterLinks = this.element.querySelectorAll<HTMLButtonElement>('button.filter__link');
        filterLinks.forEach((link) => {
           link.addEventListener('click', (e) => {
               e.preventDefault();
               this.onClickFilter(link.dataset.value);
           });
        });
    }

    private onClickFilter(value: string) {
        const isSelected = this.selectedItems.includes(value);

        if (!this.parsedQuery.facets[this.filterName]) {
            this.parsedQuery.facets[this.filterName] = [];
        }

        const filterValues: string[] = this.parsedQuery.facets[this.filterName];

        if (isSelected) {
            this.parsedQuery.facets[this.filterName] = filterValues.filter(filterItem => filterItem !== value);
            this.updateUrl();
        } else if (!filterValues.includes(value)) {
            this.parsedQuery.facets[this.filterName].push(value);
            this.updateUrl();
        }
    }

    private updateUrl() {
        window.location.href = `${ window.location.href.split('?')[0] }?${ queryToUrlParams(this.parsedQuery) }`;
    }

    private getParamsFromUrl(): void {
        const url = new URL(window.location.href);
        const searchParams = new URLSearchParams(url.search);
        const query = searchParams.get('q');

        this.parsedQuery = parseQuery(query);
        if (!query) {
            this.selectedItems = [];
        } else {
            this.selectedItems = this.parsedQuery.facets[this.filterName] ?? [];
        }
    }

}

if (document.readyState !== 'loading') {
    // Ready to go!
    SearchFilter.registerWidget();
    SearchFilter.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        SearchFilter.registerWidget();
        SearchFilter.attachWidgetToElements(document);
    });
}
