import { BaseWidget } from './base-widget';

export class StickyNote extends BaseWidget {
    public static readonly NAME = 'sticky-note';

    private readonly closeButton;

    constructor(element: HTMLElement) {
        super(element);

        this.closeButton = element.querySelector<HTMLButtonElement>('.sticky-note__close');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: StickyNote.NAME,
                load: StickyNote.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ StickyNote.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new StickyNote(element);
            newWidget.init();
        });
    }

    public init(): void {
        this.closeButton.addEventListener('click', () => { this.onClose() });
    }

    public onClose(): void {
        this.element.remove();
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    StickyNote.registerWidget();
    StickyNote.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        StickyNote.registerWidget();
        StickyNote.attachWidgetToElements(document);
    });
}
