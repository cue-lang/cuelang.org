import { BaseDialog } from './base-dialog';

export class Dialog extends BaseDialog {
    public static readonly NAME = 'dialog';

    constructor(element: HTMLElement) {
        super(element);
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Dialog.NAME,
                load: Dialog.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Dialog.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Dialog(element);
            newWidget.init();
        });
    }

    public init(): void {
        super.init();
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Dialog.registerWidget();
    Dialog.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Dialog.registerWidget();
        Dialog.attachWidgetToElements(document);
    });
}
