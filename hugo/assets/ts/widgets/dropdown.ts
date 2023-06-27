import { BaseWidget } from './base-widget';

export class Dropdown extends BaseWidget {
    public static readonly NAME = 'dropdown';

    private readonly detailsElement: HTMLDetailsElement;
    private readonly closers: NodeListOf<HTMLElement>;

    constructor(element: HTMLElement) {
        super(element);

        this.detailsElement = this.element as HTMLDialogElement;
        this.closers = this.element.querySelectorAll('[data-dropdown-close]');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Dropdown.NAME,
                load: Dropdown.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Dropdown.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Dropdown(element);
            newWidget.init();
        });
    }

    public init(): void {
        this.closers.forEach((button) => {
            button.addEventListener('click', () => {
                this.detailsElement.removeAttribute('open');
            });
        });

        document.addEventListener('click', (e: MouseEvent) => {
            if (!this.element.contains(e.target as HTMLElement) && this.detailsElement.open) {
                this.detailsElement.removeAttribute('open');
            }
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Dropdown.registerWidget();
    Dropdown.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Dropdown.registerWidget();
        Dropdown.attachWidgetToElements(document);
    });
}
