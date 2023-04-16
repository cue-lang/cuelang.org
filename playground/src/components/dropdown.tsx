import * as React from 'react';
import { MouseEvent, MutableRefObject } from 'react';
import cx from 'classnames';

export interface DropdownItem {
    key: string;
    link: string;
    name: string;
}

interface AppProps {
    active?: boolean;
    disabled?: boolean;
    buttonClass?: string;
    buttonTitle: string;
    className?: string;
    id: string;
    items: DropdownItem[];
}

interface AppState {
    active: boolean;
}

export class Dropdown extends React.Component<AppProps, AppState> {
    public dropdownRef: MutableRefObject<HTMLDivElement>;

    constructor(props: AppProps) {
        super(props);

        this.state = {
            active: props.active ?? false
        };

        this.dropdownRef = React.createRef();
        this.onDocumentClick = this.onDocumentClick.bind(this);
        this.onToggleClick = this.onToggleClick.bind(this);
    }

    public componentDidMount() {
        document.addEventListener('click', this.onDocumentClick);
        document.addEventListener('touchstart', this.onDocumentClick);
    }

    public componentWillUnmount() {
        document.removeEventListener('click', this.onDocumentClick);
        document.removeEventListener('touchstart', this.onDocumentClick);
    }

    public isActive () {
        return (typeof this.props.active === 'boolean') ?
            this.props.active :
            this.state.active;
    }

    public hide() {
        this.setState({
            active: false
        });
    }

    public show() {
        this.setState({
            active: true
        },);
    }

    public render () {
        const dropdownClasses = cx({
            'cue-dropdown': true,
            'is-active': this.isActive(),
            'is-disabled': this.props.disabled,
        });

        const buttonClassNames = cx(
            'cue-dropdown__button',
            'cue-button',
            this.props.buttonClass,
        )
        const items = [];
        for (const item of this.props.items) {
            items.push(<li className="cue-dropdown__item" key={ item.key }>
                <a className="cue-dropdown__link"
                   href={ item.link }
                   onClick={ this.hide.bind(this) }
                >{ item.name }</a></li> );
        }

        return (
            <div className={ dropdownClasses } ref={ this.dropdownRef }>
                <button
                    aria-expanded={ this.isActive() }
                    className={ buttonClassNames }
                    disabled={ this.props.disabled }
                    id={ this.props.id }
                    onClick={ this.onToggleClick }
                >
                    { this.props.buttonTitle }
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="cue-button__icon">
                        <path d="M 12.000431,13.591605 17.29716,8.2897153 a 1.0002922,1.0001653 0 0 1 1.405849,1.4231691 l -5.990903,6.0076396 a 0.99751155,0.99738496 0 0 1 -1.353349,0.02917 L 5.2978534,9.7187172 a 1.0150118,1.014883 0 0 1 -0.2975035,-0.676589 1.0441788,1.0440463 0 0 1 0.2975035,-0.7524129 0.99751155,0.99738496 0 0 1 1.4058494,0 z"/>
                    </svg>
                </button>

                {!this.props.disabled && this.isActive() &&
                    <div className="cue-dropdown__content" aria-labelledby={ this.props.id }>
                        <ul className="cue-dropdown__list">
                            { items }
                        </ul>
                    </div>
                }
          </div>
        );
    }

    private onDocumentClick(event: Event) {
        const dropdownElement = this.dropdownRef.current;
        if (this.isActive() && event.target !== dropdownElement && !dropdownElement.contains(event.target as HTMLElement)) {
            this.hide();
        }
    }

    private onToggleClick(event: MouseEvent) {
        event.preventDefault();
        if (this.isActive()) {
            this.hide();
        } else {
            this.show();
        }
    }
}


