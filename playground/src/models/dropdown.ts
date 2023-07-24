export interface DropdownItem {
    name: string;
    value: string;
    link?: string;
}

export interface DropdownChange {
    groupId: string;
    selected: DropdownItem;
}
