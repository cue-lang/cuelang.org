import { BaseWidget } from './base-widget';

export class Anchors extends BaseWidget {
    public static readonly NAME = 'anchors';

    private readonly headers: NodeListOf<HTMLHeadingElement>;

    constructor(element: HTMLElement) {
        super(element);

        this.headers = element.querySelectorAll('h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Anchors.NAME,
                load: Anchors.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Anchors.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Anchors(element);
            newWidget.init();
        });
    }

    public init(): void {
        this.headers.forEach(header => {
            const anchor = new HTMLAnchorElement();
            anchor.classList.add('anchor');
            anchor.href = '#' + header.id;

            header.prepend(anchor);
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Anchors.registerWidget();
    Anchors.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Anchors.registerWidget();
        Anchors.attachWidgetToElements(document);
    });
}
