import { BaseWidget } from '../widgets';

export interface WidgetReference<T extends BaseWidget = BaseWidget> {
    element: HTMLElement;
    name: string;
    self: T;
}

export interface Widget {
    name: string;
    load: (container: HTMLElement) => void;
}

export enum WidgetsEvents {
    DESTROY = 'widgetsDestroy',
}

export interface WidgetDestroyEvent {
    container: HTMLElement;
}
