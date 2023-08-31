/* eslint-disable max-lines-per-function */
import { BaseWidget } from './base-widget';
import { DialogEvent, DialogEvents } from '../interfaces/dialog';

export abstract class BaseDialog extends BaseWidget {
    protected readonly dialogId: string;
    protected readonly dialog: HTMLDialogElement;
    protected readonly dialogType: 'modal' | 'non-modal' = 'modal';
    protected readonly triggers: NodeListOf<HTMLElement>;
    protected readonly toggles: NodeListOf<HTMLElement>;
    protected readonly closers: NodeListOf<HTMLElement>;

    protected readonly dialogAnimationTimeout = 400;

    protected constructor(element: HTMLElement, id?: string) {
        super(element);
        this.dialogId = id ?? this.element.getAttribute('id');
        this.dialog = document.getElementById(this.dialogId) as HTMLDialogElement;
        this.dialogType = this.element.dataset.dialogType === 'non-modal' ? 'non-modal' : 'modal';
        this.triggers = document.querySelectorAll<HTMLElement>(`[href="#${ this.dialogId }"], [data-dialog-trigger="${ this.dialogId }"]`);
        this.toggles = document.querySelectorAll<HTMLElement>(`[data-dialog-toggle="${ this.dialogId }"]`);
        this.closers = this.element.querySelectorAll<HTMLElement>(`[data-dialog-close="${ this.dialogId }"]`);
    }

    public init(): void {
        if (!this.dialog) {
            return;
        }

        this.initListeners();
    }

    public initListeners() {
        // Open on triggers
        if (this.triggers) {
            this.triggers.forEach((item) => {
                item.addEventListener('click', (e: Event) => {
                    e.preventDefault();
                    this.open(item);
                });
            });
        }

        // Toggle triggers
        if (this.toggles) {
            this.toggles.forEach((item) => {
                item.addEventListener('click', (e: Event) => {
                    e.preventDefault();

                    if (this.dialog.open) {
                        this.close();
                    } else {
                        this.open(item);
                    }
                });
            });
        }

        // Close on close buttons
        if (this.closers) {
            this.closers.forEach((item) => {
                item.addEventListener('click', (e: Event) => {
                    e.preventDefault();
                    this.close();
                });
            });
        }

        // Close on backdrop click
        this.dialog.addEventListener('click', (event: MouseEvent) => {
            const rect = this.dialog.getBoundingClientRect();
            const isInDialog = (rect.top <= event.clientY && event.clientY <= rect.top + rect.height
                && rect.left <= event.clientX && event.clientX <= rect.left + rect.width);
            if (!isInDialog) {
                this.close();
            }
        });

        // Listen to close/open events + trigger optional callbacks
        this.dialog.addEventListener('close', () => {
            this.afterClose();
        });

        // Listen to external close/open events
        document.addEventListener(DialogEvents.CLOSE, (e: CustomEvent<DialogEvent>) => {
            if (e.detail.dialogElement && e.detail.dialogElement === this.element) {
                this.close();
            }
        });

        document.addEventListener(DialogEvents.OPEN, (e: CustomEvent<DialogEvent>) => {
            if (e.detail.dialogElement && e.detail.dialogElement === this.element) {
                this.open();
            }
        });
    }

    public open(_trigger?: HTMLElement): void {
        // Function overwrites can do something with trigger, not used in base for now
        this.dialog.classList.remove('is-closed');

        if (this.dialogType === 'non-modal') {
            this.dialog.show();
        } else {
            this.dialog.showModal();
        }
    }

    public close(): void {
        this.dialog.classList.add('is-closed');
        // Set timeout for close animation (css)
        setTimeout(() => {
            this.dialog.close();
        }, this.dialogAnimationTimeout);
    }

    public afterClose(): void {
        // Nothing atm
    }
}
