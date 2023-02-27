import { BaseWidget } from './base-widget';
import { StorageService } from '../helpers/storage-service';

export class NotificationBar extends BaseWidget {
    public static readonly NAME = 'notification-bar';

    private readonly identifier: string;
    private readonly closeButton: HTMLButtonElement;
    private readonly storage: StorageService;

    constructor(element: HTMLElement) {
        super(element);

        this.storage = new StorageService();
        this.identifier = 'notification_' + (element.dataset.notificationBar || 'default');
        this.closeButton = element.querySelector<HTMLButtonElement>('.notification-bar__close');
    }

    public static registerWidget(): void {
        if (window.app !== undefined) {
            window.app.addWidget({
                name: NotificationBar.NAME,
                load: NotificationBar.attachWidgetToElements,
            });
        }
    }

    public static attachWidgetToElements(container: HTMLElement | Document): void {
        const elements = container.querySelectorAll<HTMLElement>(`[data-${ NotificationBar.NAME }]`);
        elements.forEach((element) => {
            const newWidget = new NotificationBar(element);
            newWidget.init();
        });
    }

    public init(): void {
        if (!this.isHiddenBefore()) {
            this.closeButton.addEventListener('click', () => { this.onClose(); });
            this.show();
        }
    }

    public onClose(): void {
        this.hide();
        this.setHiddenBefore();
    }

    public show(): void {
        this.element.classList.remove('is-hidden');
    }

    public hide(): void {
        this.element.classList.add('is-hidden');
    }

    private isHiddenBefore(): boolean {
        return this.storage.getItem(this.identifier) === 'hide';
    }

    private setHiddenBefore(): void {
        this.storage.setItem(this.identifier, 'hide');
    }
}

if (document.readyState !== 'loading') {
    // Ready to go!
    NotificationBar.registerWidget();
    NotificationBar.attachWidgetToElements(document);
}
else {
    // Still loading, so wait...
    document.addEventListener('DOMContentLoaded', () => {
        NotificationBar.registerWidget();
        NotificationBar.attachWidgetToElements(document);
    });
}
