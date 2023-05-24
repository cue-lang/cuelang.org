import { BaseWidget } from './base-widget';

export class Menu extends BaseWidget {
    public static readonly NAME = 'menu';

    private readonly dropdowns: NodeListOf<HTMLElement>;
    private isOpen = false;

    constructor(element: HTMLElement) {
        super(element);

        this.dropdowns = this.element.querySelectorAll<HTMLElement>('[data-menu-dropdown]');
    }

    public static registerWidget() {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: Menu.NAME,
                load: Menu.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document) {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ Menu.NAME }]`);

        elements.forEach((element) => {
            const newWidget = new Menu(element);
            newWidget.init();
        });
    }

    public init() {
        this.dropdowns.forEach((dropdownElement: HTMLElement) => {
            const trigger: HTMLElement = dropdownElement;
            const target: HTMLElement = this.getTarget(trigger);
            const input: HTMLInputElement = target.querySelector<HTMLInputElement>('input[type="text"]');

            if (target) {
                trigger.addEventListener('click', (e) => {
                    e.preventDefault();

                    if (trigger.classList.contains('is-active')) {
                        this.close(trigger, target, input);
                    } else {
                        this.closeOthers(trigger);
                        this.open(trigger, target, input);
                    }
                });

                document.addEventListener('click', (e: MouseEvent) => {
                    if (!this.element.contains(e.target as HTMLElement) && this.isOpen) {
                        this.close(trigger, target, input);
                    }
                });

                document.addEventListener('focusin', (e: FocusEvent) => {
                    if (!this.element.contains(e.target as HTMLElement) && this.isOpen) {
                        this.close(trigger, target, input);
                    }
                });

                document.addEventListener('keyup', (e: KeyboardEvent) => {
                    if (e.code == 'Escape') {
                        this.close(trigger, target, input);
                    }
                });
            }
        });
    }

    public getTarget(trigger: HTMLElement) {
        const targetId: string = trigger.dataset.menuDropdown;

        return document.querySelectorAll(`[data-menu-dropdown-target="${ targetId }"]`).item(0) as HTMLElement;
    }

    public open(trigger: HTMLElement, target: HTMLElement, input: HTMLInputElement) {
        this.isOpen = true;

        requestAnimationFrame(()  => {
            target.classList.add('is-active');
            trigger.classList.add('is-active');

            requestAnimationFrame(()  => {
                target.classList.add('is-open');
                input.focus();
            });
        });
    }

    public close(trigger: HTMLElement, target: HTMLElement, input: HTMLInputElement) {
        this.isOpen = false;

        requestAnimationFrame(() => {
            target.classList.remove('is-open');
            trigger.classList.remove('is-active');

            requestAnimationFrame(() => {
                window.setTimeout(() => {
                    target.classList.remove('is-active');
                }, 400);
                input.value = '';
            });
        });
    }

    public closeOthers(currentTrigger: HTMLElement) {
        this.dropdowns.forEach((dropdownElement) => {
            const trigger: HTMLElement = dropdownElement;

            if (trigger !== currentTrigger) {
                const target: HTMLElement = this.getTarget(trigger);

                trigger.classList.remove('is-active');
                target.classList.remove('is-active', 'is-open');
            }
        });
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    Menu.registerWidget();
    Menu.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        Menu.registerWidget();
        Menu.attachWidgetToElements(document);
    });
}
