import { BaseWidget } from './base-widget';

export class TabsNav extends BaseWidget {
    public static readonly NAME = 'tabs-nav';

    private readonly tabList: HTMLElement;
    private readonly paginationPrev: HTMLElement;
    private readonly paginationNext: HTMLElement;

    private showPaginationControls = false;
    private prevDisabled = true;
    private nextDisabled = true;
    private scrollDistance = 0;

    constructor(element: HTMLElement) {
        super(element);

        this.tabList = this.element.getElementsByClassName('tabs-nav__tabs').item(0) as HTMLElement;
        this.paginationPrev = this.element.getElementsByClassName('tabs-nav__pagination--prev').item(0) as HTMLElement;
        this.paginationNext = this.element.getElementsByClassName('tabs-nav__pagination--next').item(0) as HTMLElement;
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: TabsNav.NAME,
                load: TabsNav.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ TabsNav.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new TabsNav(element);
            newWidget.init();
        });
    }

    public init(): void {
        if (!this.tabList) {
            return;
        }

        this.checkPaginationEnabled();

        // Reset scroll + check for pagination on resize
        window.addEventListener('resize', () => {
            this.scrollDistance = 0;  // reset scroll distance
            this.checkPaginationEnabled();
        });

        // Listen to scroll event and save position
        this.tabList.addEventListener('scroll', () => {
            this.scrollDistance = this.tabList.scrollLeft;
            this.checkScrollingControls();
        });

        // Add listeners to prev & next buttons
        this.paginationPrev.addEventListener('click', (e) => {
            e.preventDefault();
            this.handlePagination('prev');
        });

        this.paginationNext.addEventListener('click', (e) => {
            e.preventDefault();
            this.handlePagination('next');
        });
    }

    public checkPaginationEnabled(): void {
        // Calculate if tablist doesn't fit in container
        const elemWidth = this.element.offsetWidth +
            parseFloat(window.getComputedStyle(this.element).marginLeft) +
            parseFloat(window.getComputedStyle(this.element).marginRight);

        const isEnabled = this.tabList.scrollWidth > elemWidth;

        // If pagination is not enable: reset scroll position
        if (!isEnabled) {
            this.scrollDistance = 0;
            this.scrollTo(0);
        }

        // Add classes to hide/show pagination
        this.showPaginationControls = isEnabled;
        if (this.showPaginationControls) {
            this.paginationPrev.classList.remove('is-hidden');
            this.paginationNext.classList.remove('is-hidden');
        } else {
            this.paginationPrev.classList.add('is-hidden');
            this.paginationNext.classList.add('is-hidden');
        }

        // Check scrolling controls again
        this.checkScrollingControls();
    }

    public checkScrollingControls(): void {
        if (!this.showPaginationControls) {
            this.prevDisabled = true;
            this.nextDisabled = true;
        } else {
            this.prevDisabled = this.scrollDistance === 0;
            this.nextDisabled = this.scrollDistance >= (this.tabList.scrollWidth - this.tabList.offsetWidth);
        }

        if (this.prevDisabled) {
            this.paginationPrev.setAttribute('disabled', '');
        } else {
            this.paginationPrev.removeAttribute('disabled');
        }

        if (this.nextDisabled) {
            this.paginationNext.setAttribute('disabled', '');
        } else {
            this.paginationNext.removeAttribute('disabled');
        }
    }

    public handlePagination(direction: 'next' | 'prev'): void {
        const scrollStep = 100;
        const scrollAmount = (direction === 'prev' ? -1 : 1) * scrollStep;
        this.scrollTo(scrollAmount);
    }

    private scrollTo(position: number): void {
        this.tabList.scrollBy(Math.round(position), 0);
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    TabsNav.registerWidget();
    TabsNav.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        TabsNav.registerWidget();
        TabsNav.attachWidgetToElements(document);
    });
}
