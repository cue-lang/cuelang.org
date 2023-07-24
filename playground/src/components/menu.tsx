import * as React from 'react';
import { MouseEvent, MutableRefObject, PropsWithChildren } from 'react';
import cx from 'classnames';
import { Icon } from './icon';

interface MenuProps {
    cssClass?: string;
    id: string;
    icon?: string;
    open?: boolean;
    title: string;
    type?: 'default' | 'icon' | 'icon-mobile';
    onOpen?: () => void;
    onClose?: () => void;
}

interface MenuState {
    open: boolean;
}

export class Menu extends React.Component<PropsWithChildren<MenuProps>, MenuState> {
    public menuRef: MutableRefObject<HTMLDivElement>;
    public overlayRef: MutableRefObject<HTMLDivElement>;

    constructor(props: MenuProps) {
        super(props);

        this.state = {
            open: props.open ?? false,
        };

        this.menuRef = React.createRef();
        this.overlayRef = React.createRef();
    }

    public componentDidMount() {
        document.addEventListener('click', this.onDocumentClick.bind(this));
        document.addEventListener('touchstart', this.onDocumentClick.bind(this));
    }

    public componentWillUnmount() {
        document.removeEventListener('click', this.onDocumentClick);
        document.removeEventListener('touchstart', this.onDocumentClick);
    }

    public componentDidUpdate(prevProps: MenuProps) {
        if (prevProps.open !== this.props.open) {
            this.setState({
                open: this.props.open
            });
        }
    }

    public hide() {
        this.setState({
            open: false
        }, () => {
            if (this.props.onClose) {
                this.props.onClose();
            }
        });

    }

    public show() {
        this.setState({
            open: true
        }, () => {
            if (this.props.onOpen) {
                this.props.onOpen();
            }
        });
    }

    public render () {
        const cssClasses = cx({
            'is-open': this.state.open,
            'cue-menu--icon': this.props.type === 'icon',
            'cue-menu--icon-mobile': this.props.type === 'icon-mobile',
        }, 'cue-menu', this.props.cssClass);

        return (
            <div className={ cssClasses } ref={ this.menuRef }>
                <button
                    aria-expanded={ this.state.open }
                    className="cue-menu__button"
                    id={ this.props.id }
                    onClick={ this.onToggleClick.bind(this) }
                >
                    { this.props.icon &&
                        <span className="cue-menu__icon">
                            <Icon icon={ this.props.icon }></Icon>
                        </span>
                    }
                    <span className="cue-menu__text">{ this.props.title }</span>

                    { this.props.type !== 'icon' &&
                        <span className="cue-menu__chevron">
                            <Icon icon={ 'chevron-down' }></Icon>
                        </span>
                    }
                </button>

                { this.state.open &&
                    <div className="cue-menu__dropdown" aria-labelledby={ this.props.id }>
                        { this.props.children }
                    </div>
                }

                { this.state.open &&
                    <div className="cue-menu__overlay" ref={ this.overlayRef }></div>
                }
          </div>
        );
    }

    private onDocumentClick(event: Event) {
        if (!this.state.open) {
            return;
        }

        const dropdownElement = this.menuRef.current;
        // Check if target is still in DOM because could be React removed it so we can't us contains on it anymore
        const targetInDom = document.body.contains((event.target as HTMLElement));
        const clickOnOverlay = targetInDom && event.target === this.overlayRef.current;
        const clickOutside = targetInDom && event.target !== dropdownElement &&
            !dropdownElement.contains(event.target as HTMLElement);

        if (clickOnOverlay || clickOutside) {
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


