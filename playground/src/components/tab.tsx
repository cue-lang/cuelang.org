import * as React from 'react';
import { PropsWithChildren, ReactNode } from 'react';
import { DropdownChange, DropdownItem } from '@models/dropdown';

export interface TabProps {
    activeItem: DropdownItem;
    children: ReactNode;
    disabled?: boolean;
    groupId: string;
    name: string;
    open?: boolean;
    readonly?: boolean;
    type?: string;
    menu?: TabMenu;
    onOptionSelect?: {(change: DropdownChange): void};
    onFormatClick?: { (): void }
}

export interface TabMenu {
    options: DropdownItem[];
    actions: {
        format: boolean;
    } | false;
}

const defaultProps = {
    disabled: false,
    items: [] as DropdownItem[],
    open: false,
    type: 'default',
}

export class Tab extends React.Component<PropsWithChildren<TabProps>> {
    constructor(props: PropsWithChildren<TabProps>) {
        super({ ...defaultProps, ...props, });
    }

    public render () {
        return (
            <div className="tabs__panel">{ this.props.children }</div>
        );
    }
}
