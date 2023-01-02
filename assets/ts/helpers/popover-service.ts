export interface IPopoverOptions {
    closeable?: boolean;
    cssClass?: string | false;
    onInsert?: ((overlay: HTMLElement) => void | boolean) | null;
    onClose?: ((overlay: HTMLElement) => void | boolean) | null;
}

export class PopoverService {

    static spawnPopover(innerHtml: string, args: IPopoverOptions): void {
        const defaults: IPopoverOptions = {
            closeable: true,
            cssClass: false,
            onInsert: null,
            onClose: null,
        };

        const options: IPopoverOptions = Object.assign({}, defaults, args);
        const html = this.createPopover(innerHtml, options);

        requestAnimationFrame(() => {
            document.body.insertAdjacentHTML('beforeend', html);
            const popover = document.getElementsByClassName('popover').item(0) as HTMLElement;

            requestAnimationFrame(() => {
                this.onInsert(popover, options);
            });
        });
    }

    static createPopover(html: string, options: IPopoverOptions): string {
        const cssClass = ('popover ' + (options.cssClass ? options.cssClass : '')).trim();

        return `<div class="${ cssClass }">
                    <div class="popover__mask"></div>
                    <div class="popover__content">
                        ${ options.closeable ? '<button class="popover__close"><span>Sluiten</span></button>' : '' }
                        ${ html }
                    </div>
                </div>`;
    }

    static onInsert(popover: HTMLElement, options: IPopoverOptions): void {
        popover.classList.add('is-active');

        if (options.closeable) {
            // Listen for close button
            const close = popover.getElementsByClassName('popover__close').item(0) as HTMLElement;
            close.addEventListener('click', (e) => {
                e.preventDefault();
                PopoverService.closePopover(popover, options);
            });

            const mask = popover.getElementsByClassName('popover__mask').item(0) as HTMLElement;
            mask.addEventListener('click', (e) => {
                e.preventDefault();
                PopoverService.closePopover(popover, options);
            });
        }

        if (options.onInsert) {
            options.onInsert(popover);
        }
    }

    static closePopover(popover: HTMLElement, options: IPopoverOptions): void {
        if (options.onClose) {
            options.onClose(popover);
        }

        requestAnimationFrame(() => {
            window.setTimeout(() => {
                popover.classList.remove('is-active');
            }, 100);

            requestAnimationFrame(() => {
                window.setTimeout(() => {
                    popover.remove();
                }, 300);
            });
        });
    }
}
