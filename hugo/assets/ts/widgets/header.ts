import { BaseWidget } from './base-widget';

export class Header extends BaseWidget {
    public static readonly NAME = 'header';

    private updateScheduled = false;
    private screenWidth: number;
    private headerHeight: number;
    private readonly scrollOffset = 200; // hides after this amount on scroll down
    private scrollingDown = true;
    private scrollY = 0;
    private scrollYOld = 0;

    constructor(element: HTMLElement) {
        super(element);

        this.screenWidth = window.innerWidth;
        this.headerHeight = this.element.clientHeight;
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Header.NAME,
                load: Header.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Header.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Header(element);
            newWidget.init();
        });
    }

    public init(): void {
        window.addEventListener('scroll', () => { this.onScroll(); });
        window.addEventListener('resize', () => { this.onResize(); });

        // And calc it once at init
        this.onScroll();
    }

    public onScroll(): void {
        this.scrollY = window.scrollY;
        this.scrollingDown = (this.scrollY >= this.scrollYOld);
        this.scrollYOld = this.scrollY;

        if (!this.updateScheduled) {
            this.updateScheduled = true;

            requestAnimationFrame(() => {
                this.setSticky();
                this.setVisibility();
                this.updateScheduled = false;
            });
        }
    }

    public onResize(): void {
        // Update offset / width on window-resize
        this.screenWidth = window.innerWidth;
        this.headerHeight = this.element.clientHeight;
    }

    public setSticky(): void {
        if (this.scrollY > this.headerHeight + this.scrollOffset) {
            this.element.classList.add('is-sticky');
        }
        else {
            this.element.classList.remove('is-sticky', 'is-shown');
        }
    }

    public setVisibility(): void {
        if (this.scrollY > this.headerHeight + this.scrollOffset) {
            if (this.scrollingDown) {
                this.element.classList.remove('is-shown');
            }
            else {
                this.element.classList.add('is-shown');
            }
        }
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Header.registerWidget();
    Header.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Header.registerWidget();
        Header.attachWidgetToElements(document);
    });
}
