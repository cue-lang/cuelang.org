export interface TabEventData {
    originalElement: HTMLElement;
    tabGroup: string;
    tabId: string;
}

export enum TabEvents {
    SWITCH_TAB = 'switchTab',
}
