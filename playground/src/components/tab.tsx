import * as React from 'react';
import { PropsWithChildren } from 'react';

export interface TabProps {
    name: string;
    disabled?: boolean;
    type?: string;
}

const defaultProps = {
    name: '',
    disabled: false,
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
