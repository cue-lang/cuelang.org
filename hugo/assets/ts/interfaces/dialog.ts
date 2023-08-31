export enum DialogEvents {
    OPEN = 'dialogOpen',
    CLOSE = 'dialogClose',
}

export interface DialogEvent {
    dialogElement: HTMLElement;
}
