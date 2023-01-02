export abstract class BaseWidget
{
    public static readonly NAME: string;
    public element: HTMLElement;

    protected constructor(element: HTMLElement) {
        this.element = element;
    }

    protected abstract init(): void;
}

