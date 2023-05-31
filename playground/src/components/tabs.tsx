import * as React from 'react';
import { JSXElementConstructor, MouseEvent, MutableRefObject, PropsWithChildren, ReactNode } from 'react';
import { Icon } from './icon';
import cx from 'classnames';
import { Tab } from './tab';

interface TabItem {
    name: string;
    disabled?: boolean;
    children: ReactNode;
    type?: string;
}

interface TabsProps {
    activeIndex?: number;
}

interface TabsState {
    activeIndex: number;
    nextDisabled: boolean;
    prevDisabled: boolean;
    scrollDistance: number;
    showPaginationControls: boolean;
}

export class Tabs extends React.Component<PropsWithChildren<TabsProps>, TabsState> {
    public tabNavRef: MutableRefObject<HTMLDivElement>;
    public tabListRef: MutableRefObject<HTMLUListElement>;

    constructor(props: PropsWithChildren<TabsProps>) {
        super(props);
        this.tabNavRef = React.createRef<HTMLDivElement>();
        this.tabListRef = React.createRef<HTMLUListElement>();

        this.state = {
            activeIndex: props.activeIndex ?? 0,
            nextDisabled: true,
            prevDisabled: true,
            scrollDistance: 0,
            showPaginationControls: false,
        };
    }

    public componentDidMount() {
        window.addEventListener('resize', this.onWindowResize.bind(this));

        this.checkPaginationEnabled();
    }

    public componentWillUnmount() {
        window.removeEventListener('resize', this.onWindowResize);
    }

    public onWindowResize() {
        this.setState({
            scrollDistance: 0
        }, this.checkPaginationEnabled.bind(this));
    }

    public handleTabsScroll() {
        this.setState({
            scrollDistance: this.tabListRef.current.scrollLeft,
        }, this.checkScrollingControls.bind(this));
    }

    public handlePaginationClick(e: MouseEvent, direction: 'prev' | 'next'): void {
        e.preventDefault();
        const scrollStep = 100;
        const scrollAmount = (direction === 'prev' ? -1 : 1) * scrollStep;
        this.scrollTo(scrollAmount);
    }

    public checkPaginationEnabled(): void {
        // Calculate if tablist doesn't fit in container
        const elemWidth = this.tabNavRef.current.offsetWidth +
            parseFloat(window.getComputedStyle(this.tabNavRef.current).marginLeft) +
            parseFloat(window.getComputedStyle(this.tabNavRef.current).marginRight);

        const isEnabled = this.tabListRef.current.scrollWidth > elemWidth;

        // If pagination is not enabled: reset scroll position
        if (!isEnabled) {
            this.setState({
                scrollDistance: 0,
                showPaginationControls: false,
            }, this.checkScrollingControls.bind(this))
            this.scrollTo(0);
        } else {
            this.setState({
                showPaginationControls: true,
            }, this.checkScrollingControls.bind(this))
        }
    }

    public checkScrollingControls(): void {
        if (!this.state.showPaginationControls) {
            this.setState({
                prevDisabled: true,
                nextDisabled: true,
            })
        } else {
            this.setState({
                prevDisabled: this.state.scrollDistance === 0,
                nextDisabled: this.state.scrollDistance >= (this.tabListRef.current.scrollWidth - this.tabListRef.current.offsetWidth),
            })
        }
    }

    public scrollTo(position: number): void {
        this.tabNavRef.current.scrollBy(Math.round(position), 0);
    }

    public selectTab(e: MouseEvent, index: number) {
        e.preventDefault();
        this.setState({ activeIndex: index });
    }

    public render () {
        const tabs: TabItem[] = [];
        React.Children.forEach(this.props.children, (child) => {
            const type = ((child as React.ReactElement).type as JSXElementConstructor<any>);
            if (React.isValidElement(child) && (type.prototype === Tab.prototype)) {
                tabs.push({
                    name: child.props.name,
                    disabled: child.props.disabled,
                    children: child.props.children,
                    type: child.props.type,
                })
            }
        });

        return (
            <div className="cue-tabs">
                <div className="cue-tabs__nav cue-tabs-nav" ref={ this.tabNavRef }>
                    { this.state.showPaginationControls &&
                        <button
                            className="cue-tabs-nav__pagination cue-tabs-nav__pagination--prev"
                            disabled={ this.state.prevDisabled }
                            onClick={(e) => this.handlePaginationClick(e, 'prev')}
                        >
                            <span className="cue-tabs-nav__icon">
                                <Icon icon="chevron-left"></Icon>
                            </span>
                        </button>
                    }

                    <ul className="cue-tabs-nav__tabs" role="tablist"
                        ref={ this.tabListRef }
                        onScroll={ this.handleTabsScroll.bind(this) }
                    >
                        { tabs.map((tab, index) =>
                            <li className="cue-tabs-nav__item" key={`tab-${ index }`}>
                                <button
                                    disabled={ tab.disabled }
                                    aria-selected={ index === this.state.activeIndex }
                                    className={ cx('cue-tabs-nav__tab', {
                                        'is-active': index === this.state.activeIndex,
                                        'cue-tabs-nav__tab--terminal': tab.type === 'terminal',
                                    }) }
                                    onClick={ (e) => this.selectTab(e, index) }
                                >{ tab.name }</button>
                            </li>
                        )}
                    </ul>

                    { this.state.showPaginationControls &&
                        <button
                            className="cue-tabs-nav__pagination cue-tabs-nav__pagination--next"
                            disabled={ this.state.nextDisabled }
                            onClick={(e) => this.handlePaginationClick(e, 'next')}
                        >
                            <span className="cue-tabs-nav__icon">
                               <Icon icon="chevron-right"></Icon>
                            </span>
                        </button>
                    }
                </div>

                <div className="cue-tabs__content">
                    { tabs.map((tab, index) =>
                        <div key={`tab-content-${ index }`}  className={ cx('cue-tabs__item', {
                            'is-active': index === this.state.activeIndex,
                        }) }>{ tab.children }
                        </div>
                    )}
                </div>
            </div>
        )
    }
}
