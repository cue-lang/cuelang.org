import { WidgetsEvents, WidgetDestroyEvent } from '../interfaces/widget';

export abstract class BaseWidget {
    public static readonly NAME: string;
    public element: HTMLElement;

    protected constructor(element: HTMLElement) {
        this.element = element;
    }

    public init(): void {
        document.addEventListener(WidgetsEvents.DESTROY, (e: CustomEvent<WidgetDestroyEvent>) => {
            if (e.detail.container && e.detail.container.contains(this.element)) {
                this.destroy();
            }
        });
    }

    public destroy(): void {
        // Nothing atm
    }
}

