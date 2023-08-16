import * as React from 'react';
import { MouseEvent, MutableRefObject } from 'react';
import cx from 'classnames';
import { DropdownChange, DropdownItem } from '@models/dropdown';
import { Icon } from '@components/icon';

interface DropdownProps {
    activeItem: DropdownItem;
    cssClass?: string;
    disabled?: boolean;
    readonly?: boolean;
    disabledText?: string;
    groupId: string;
    items: DropdownItem[];
    name?: string;
    onDropdownSelect?: {(change: DropdownChange): void};
    open?: boolean;
}

interface DropdownState {
    activeItem: DropdownItem;
    open: boolean;
}

export class Dropdown extends React.Component<DropdownProps, DropdownState> {
    public dropdownRef: MutableRefObject<HTMLDivElement>;

    constructor(props: DropdownProps) {
        super(props);

        this.state = {
            open: props.open ?? false,
            activeItem: props.activeItem,
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

    public componentDidUpdate(prevProps: DropdownProps) {
        if (prevProps.open !== this.props.open) {
            this.setState({
                open: this.props.open
            });
        }

        if (prevProps.activeItem !== this.props.activeItem) {
            this.setState({
                activeItem: this.props.activeItem
            });
        }
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
            'is-open': this.state.open,
            'is-disabled': this.props.disabled,
            'is-readonly': this.props.readonly,
        }, this.props.cssClass);

        const items = [];
        for (const item of this.props.items) {
            const linkClassNames = cx({
                'is-selected': item.value === this.state.activeItem.value
                }, 'cue-dropdown__link');

            items.push(<li className="cue-dropdown__item" key={ item.value }>
                { item.link
                    ?  <a className={ linkClassNames }
                          href={ item.link }
                          onClick={ () => this.onLinkClick(item) }
                    >{ item.name }</a>
                    : <button className={ linkClassNames }
                              onClick={(e) => this.onClick(e, item)}
                    >{ item.name }</button>
                }
               </li>);
        }
        const buttonText = `${ this.props.name ? (this.props.name + ': ') : ''}${ this.state.activeItem.name ?? ''}`;
        const disabledText = `${ this.props.name ? (this.props.name + ': ') : ''}${ this.props.disabledText ?? 'N/A' }`;
        const disabled = this.props.disabled || items.length <= 1;
        return (
            <div className={ dropdownClasses } ref={ this.dropdownRef }>
                <button
                    aria-expanded={ this.state.open }
                    className="cue-dropdown__button"
                    disabled={ disabled || this.props.readonly }
                    id={ this.props.groupId }
                    onClick={ this.onToggleClick.bind(this) }
                >
                    <span className="cue-dropdown__text">
                        { this.props.disabled ? disabledText : buttonText }
                    </span>

                    { (!disabled && !this.props.readonly ) &&
                        <span className="cue-dropdown__icon">
                            <Icon icon="chevron-down"></Icon>
                        </span>
                    }
                </button>

                { (!this.props.disabled && !this.props.readonly && this.state.open) &&
                    <div className="cue-dropdown__content" aria-labelledby={ this.props.groupId }>
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
            activeItem: item,
        });

        this.hide();
    }

    private onClick(event: MouseEvent, item: DropdownItem) {
        event.preventDefault();
        this.setState({
            activeItem: item,
        });
        this.props.onDropdownSelect({
            groupId: this.props.groupId,
            selected: item,
        });
        this.hide();
    }

    private onDocumentClick(event: Event) {
        if (!this.state.open) {
            return;
        }
        const dropdownElement = this.dropdownRef.current;
        if (event.target !== dropdownElement && !dropdownElement.contains(event.target as HTMLElement)) {
            this.hide();
        }
    }

    private onToggleClick(event: MouseEvent) {
        event.preventDefault();
        if (this.state.open) {
            this.hide();
        } else {
            this.show();
        }
    }
}


