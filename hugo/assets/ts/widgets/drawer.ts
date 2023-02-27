import { BaseWidget } from './base-widget';

export class Drawer extends BaseWidget {
    public static readonly NAME = 'drawer';

    private readonly drawerName: string;
    private readonly closers: NodeListOf<HTMLElement>;
    private readonly togglers: NodeListOf<HTMLElement>;
    private isOpen = false;

    constructor(element: HTMLElement) {
        super(element);

        this.drawerName = this.element.dataset.drawer;
        this.closers = document.querySelectorAll(`[data-drawer-close="${this.drawerName}"]`);
        this.togglers = document.querySelectorAll(`[data-drawer-toggle="${this.drawerName}"]`);
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Drawer.NAME,
                load: Drawer.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Drawer.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new Drawer(element);
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
            document.body.classList.add('drawer-open');
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
            document.body.classList.remove('drawer-open');
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
    Drawer.registerWidget();
    Drawer.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Drawer.registerWidget();
        Drawer.attachWidgetToElements(document);
    });
}
