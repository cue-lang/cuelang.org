import * as React from 'react';
import { MouseEvent, MutableRefObject } from 'react';
import cx from 'classnames';

export interface DropdownItem {
    value: string;
    link?: string;
    name: string;
}

interface DropdownProps {
    open?: boolean;
    activeTitle: string;
    disabled?: boolean;
    disabledText?: string;
    buttonClass?: string;
    buttonPrefix?: string;
    className?: string;
    id: string;
    items: DropdownItem[];
    onDropdownSelect?: {(groupId: string, value: string): void};
}

interface DropdownState {
    open: boolean;
    activeTitle: string;
}

export class Dropdown extends React.Component<DropdownProps, DropdownState> {
    public dropdownRef: MutableRefObject<HTMLDivElement>;

    constructor(props: DropdownProps) {
        super(props);

        this.state = {
            open: props.open ?? false,
            activeTitle: props.activeTitle ?? '',
        };

        this.dropdownRef = React.createRef();
    }

    public componentDidMount() {
        document.addEventListener('click', this.onDocumentClick.bind(this));
        document.addEventListener('touchstart', this.onDocumentClick.bind(this));
    }

    public componentWillUnmount() {
        document.removeEventListener('click', this.onDocumentClick);
        document.removeEventListener('touchstart', this.onDocumentClick);
    }

    public isOpen () {
        return (typeof this.props.open === 'boolean') ?
            this.props.open :
            this.state.open;
    }

    public hide() {
        this.setState({
            open: false
        });
    }

    public show() {
        this.setState({
            open: true
        },);
    }

    public render () {
        const dropdownClasses = cx({
            'cue-dropdown': true,
            'is-open': this.isOpen(),
            'is-disabled': this.props.disabled,
        });

        const buttonClassNames = cx(
            'cue-dropdown__button',
            'cue-button',
            this.props.buttonClass,
        )
        const items = [];
        for (const item of this.props.items) {
            items.push(<li className="cue-dropdown__item" key={ item.value }>
                { item.link
                    ?  <a className="cue-dropdown__link"
                          href={ item.link }
                          onClick={ () => this.onLinkClick(item) }
                    >{ item.name }</a>
                    : <button className="cue-dropdown__link"
                              onClick={(e) => this.onClick(e, item)}
                    >{ item.name }</button>
                }
               </li>);
        }

        return (
            <div className={ dropdownClasses } ref={ this.dropdownRef }>
                <button
                    aria-expanded={ this.isOpen() }
                    className={ buttonClassNames }
                    disabled={ this.props.disabled }
                    id={ this.props.id }
                    onClick={ this.onToggleClick.bind(this) }
                >
                    { this.props.disabled ?
                        (this.props.disabledText ?? 'N/A') :
                        ((this.props.buttonPrefix ?? '') + this.state.activeTitle)
                    }

                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" className="cue-button__icon">
                        <path d="M 12.000431,13.591605 17.29716,8.2897153 a 1.0002922,1.0001653 0 0 1 1.405849,1.4231691 l -5.990903,6.0076396 a 0.99751155,0.99738496 0 0 1 -1.353349,0.02917 L 5.2978534,9.7187172 a 1.0150118,1.014883 0 0 1 -0.2975035,-0.676589 1.0441788,1.0440463 0 0 1 0.2975035,-0.7524129 0.99751155,0.99738496 0 0 1 1.4058494,0 z"/>
                    </svg>
                </button>

                { !this.props.disabled && this.isOpen() &&
                    <div className="cue-dropdown__content" aria-labelledby={ this.props.id }>
                        <ul className="cue-dropdown__list">
                            { items }
                        </ul>
                    </div>
                }
          </div>
        );
    }

    private onLinkClick(item: DropdownItem) {
        this.setState({
            activeTitle: item.name
        });

        this.hide();
    }

    private onClick(event: MouseEvent, item: DropdownItem) {
        event.preventDefault();
        this.setState({
            activeTitle: item.name
        });
        this.props.onDropdownSelect(this.props.id, item.value);
        this.hide();
    }

    private onDocumentClick(event: Event) {
        const dropdownElement = this.dropdownRef.current;
        if (this.isOpen() && event.target !== dropdownElement && !dropdownElement.contains(event.target as HTMLElement)) {
            this.hide();
        }
    }

    private onToggleClick(event: MouseEvent) {
        event.preventDefault();
        if (this.isOpen()) {
            this.hide();
        } else {
            this.show();
        }
    }
}


