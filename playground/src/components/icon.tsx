import * as React from 'react';
import cx from 'classnames';
import { environment } from '../environment';

interface IconProps {
    cssClass?: string;
    icon: string;
}

export class Icon extends React.Component<IconProps>
{
    constructor(props: IconProps) {
        super(props);
    }

    public render() {
        const classNames = cx(
            'cue-icon',
            this.props.cssClass,
        )
        return (
            <svg className={ classNames } aria-hidden="true">
                <use xmlnsXlink="http://www.w3.org/1999/xlink" xlinkHref={ this.getSpriteUrl() }></use>
            </svg>
        );
    }

    public getSpriteUrl(): string {
        const baseUrl = environment.baseUrl;
        return `${ baseUrl }${ baseUrl.endsWith('/') ? '' : '/' }img/ui.svg#icon--${ this.props.icon }`;
    }
}
