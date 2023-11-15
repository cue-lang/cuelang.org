export enum TARGET_TYPE {
    BLANK = '_blank',
    SELF = '_self',
    PARENT = '_parent',
    TOP = '_top',
}

export interface NavItem {
    url: string;
    title: string;
    target?: TARGET_TYPE;
}
