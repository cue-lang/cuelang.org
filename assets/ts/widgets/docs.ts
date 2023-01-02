import { BaseWidget } from './base-widget';

export class Docs extends BaseWidget {
    public static readonly NAME = 'docs';

    private readonly closers: NodeListOf<HTMLElement>;
    private readonly togglers: NodeListOf<HTMLElement>;
    private isOpen = false;

    constructor(element: HTMLElement) {
        super(element);

        this.closers = document.querySelectorAll(`[data-docs-close]`);
        this.togglers = document.querySelectorAll(`[data-docs-toggle]`);
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Docs.NAME,
                load: Docs.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Docs.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Docs(element);
            newWidget.init();
        });
    }

    public init(): void {
        const close = () => {
            if (this.isOpen) {
                this.close();
            }
        };

        const toggle = () => {
            if (this.isOpen) {
                this.close();
            }
            else {
                this.open();
            }
        };

        window.addEventListener('resize', close);

        this.closers.forEach(trigger => {
            trigger.addEventListener('click', close);
        });

        this.togglers.forEach(trigger => {
            trigger.addEventListener('click', toggle);
        });
    }

    public open(): void {
        if (this.isOpen) {
            return;
        }

        this.isOpen = true;

        requestAnimationFrame(()  => {
            this.element.classList.add('is-active');
            this.togglers.forEach(trigger => {
                trigger.classList.add('is-open');
                trigger.setAttribute('aria-expanded', 'true');
            });

            requestAnimationFrame(()  => {
                this.element.classList.add('is-open');
            });
        });
    }

    public close(): void {
        if (!this.isOpen) {
            return;
        }

        this.isOpen = false;

        requestAnimationFrame(()  => {
            this.element.classList.remove('is-open');
            this.togglers.forEach(trigger => {
                trigger.classList.remove('is-open');
                trigger.setAttribute('aria-expanded', 'false');
            });

            requestAnimationFrame(()  => {
                setTimeout((() => {
                    this.element.classList.remove('is-active');
                }), 600);
            });
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Docs.registerWidget();
    Docs.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Docs.registerWidget();
        Docs.attachWidgetToElements(document);
    });
}
