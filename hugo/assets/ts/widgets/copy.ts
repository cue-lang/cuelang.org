import { BaseWidget } from './base-widget';

export class Copy extends BaseWidget {
    public static readonly NAME = 'copy';

    private readonly copyButton: HTMLElement;

    constructor(element: HTMLElement) {
        super(element);
        this.copyButton = this.element.querySelector<HTMLElement>('[data-copy-button]');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Copy.NAME,
                load: Copy.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Copy.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Copy(element);
            newWidget.init();
        });
    }

    public init(): void {
        const messageElement: HTMLElement = this.element.querySelector('[data-copy-message]');

        this.copyButton.addEventListener('click', () => {
            const copyType: string = this.copyButton.dataset.copyType;
            let content: string = this.copyButton.dataset.copyValue;

            if (copyType === 'code') {
                content = atob(content);
            }

            navigator.clipboard.writeText(content).then(() => {
                requestAnimationFrame(() => {
                    messageElement.classList.remove('is-hidden');
                    messageElement.setAttribute('aria-hidden', 'false');
                    this.copyButton.classList.add('is-success');

                    setTimeout(() => {
                        messageElement.classList.add('is-hidden');
                        messageElement.setAttribute('aria-hidden', 'true');
                        this.copyButton.classList.remove('is-success');
                    }, 1000);
                });
            });
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Copy.registerWidget();
    Copy.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Copy.registerWidget();
        Copy.attachWidgetToElements(document);
    });
}
