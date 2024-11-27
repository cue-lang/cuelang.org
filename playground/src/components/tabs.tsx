import cx from 'classnames';
import * as React from 'react';
import { JSXElementConstructor, MouseEvent, PropsWithChildren } from 'react';

import { Menu } from '@components/menu';
import { Tab, TabProps } from '@components/tab';
import { DropdownItem } from '@models/dropdown';

interface TabsProps {
    activeIndex?: number;
}

interface TabsState {
    activeIndex: number;
    activeMenu: string | null;
}

export class Tabs extends React.Component<PropsWithChildren<TabsProps>, TabsState> {
    constructor(props: PropsWithChildren<TabsProps>) {
        super(props);

        this.state = {
            activeIndex: props.activeIndex ?? 0,
            activeMenu: null,
        };
    }

    public selectTab(e: MouseEvent, index: number) {
        e.preventDefault();
        this.setState({ activeIndex: index });
    }

    public render() {
        const tabs: TabProps[] = [];
        React.Children.forEach(this.props.children, (child) => {
            const type = ((child as React.ReactElement).type as JSXElementConstructor<any>);
            if (React.isValidElement(child) && (type.prototype === Tab.prototype)) {
                tabs.push(child.props);
            }
        });

        return (
            <div className="cue-tabs">
                <div className="cue-tabs__nav cue-tabs-nav">
                    <ul className="cue-tabs-nav__tabs" role="tablist">
                        {tabs.map((tab, index) => {
                            const showMenu = tab.menu && (tab.menu.options.length > 0 || tab.menu.actions);
                            const isActive = index === this.state.activeIndex;
                            const tabName = `${tab.name ? (tab.name + ': ') : ''}${tab.activeItem.name ?? ''}`;
                            const tabClassNames = cx({
                                'is-active': isActive,
                                'cue-tabs-nav__tab--output': tab.type === 'output',
                            }, 'cue-tabs-nav__tab');

                            const menuItems: React.JSX.Element[] = [];
                            if (tab.menu?.options?.length > 1) {
                                for (const menuItem of tab.menu.options) {
                                    const linkClassNames = cx({
                                        'is-active': menuItem.value === tab.activeItem.value
                                    }, 'cue-tab-menu__link cue-tab-menu__link--group');

                                    menuItems.push(
                                        <li className="cue-tab-menu__item" key={menuItem.value}>
                                            {menuItem.link
                                                ? <a className={linkClassNames} href={menuItem.link}>{menuItem.name}</a>
                                                : <button className={linkClassNames}
                                                          onClick={(e) => this.onOptionClick(e, tab, menuItem)}
                                                >{menuItem.name}</button>
                                            }
                                        </li>
                                    );
                                }
                            }

                            const formatItem = tab.menu.actions ? <li className="cue-tab-menu__item">
                                <button className="cue-tab-menu__link"
                                        disabled={ tab.menu.actions.format.disabled }
                                        onClick={(e) => this.onFormatClick(e, tab)}
                                >Format code
                                </button>
                            </li> : '';

                            return (
                                <li className="cue-tabs-nav__item" key={`tab-${tab.groupId}`}>
                                    {(isActive && !tab.readonly && showMenu) &&
                                        <div className={tabClassNames}>
                                            <Menu
                                                id={`${tab.groupId}-${tab.name}`}
                                                cssClass="cue-menu--tab cue-tabs-nav__menu"
                                                title={tabName}
                                                showOverlay={false}
                                                open={this.state.activeMenu === tab.name}
                                                onOpen={() => {
                                                    this.setState({ activeMenu: tab.name })
                                                }}
                                                onClose={() => {
                                                    this.setState({ activeMenu: null })
                                                }}
                                            >
                                                <>
                                                    <div className="cue-tab-menu">
                                                        <ul className="cue-tab-menu__list">
                                                            {(menuItems.length > 0 && tab.menu.actions) &&
                                                                <li className="cue-tab-menu__item" key="language">
                                                                    <p className="cue-tab-menu__title">Language</p>
                                                                    <ul className="cue-tab-menu__list">
                                                                        {menuItems}
                                                                    </ul>
                                                                </li>
                                                            }

                                                            {(menuItems.length > 0 && !tab.menu.actions) &&
                                                                menuItems
                                                            }

                                                            {(tab.menu.actions && menuItems.length > 0) &&
                                                                <li className="cue-tab-menu__item" key="actions">
                                                                    <p className="cue-tab-menu__title">Actions</p>
                                                                    <ul className="cue-tab-menu__list">
                                                                        {(tab.menu.actions.format.show) &&
                                                                            formatItem
                                                                        }
                                                                    </ul>
                                                                </li>
                                                            }


                                                            {(tab.menu.actions && tab.menu.actions.format.show && menuItems.length === 0) &&
                                                                formatItem
                                                            }
                                                        </ul>
                                                    </div>
                                                </>
                                            </Menu>
                                        </div>
                                    }
                                    {(!isActive || tab.readonly || !showMenu) &&
                                        <button
                                            disabled={tab.disabled}
                                            className={cx('cue-tabs-nav__tab cue-tabs-nav__tab--button', {
                                                'is-active': isActive,
                                                'cue-tabs-nav__tab--output': tab.type === 'output',
                                            })}
                                            onClick={(e) => this.selectTab(e, index)}
                                        ><span className="cue-tabs-nav__text">{tabName}</span></button>
                                    }
                                </li>
                            )
                        })}
                    </ul>
                </div>

                <div className="cue-tabs__content">
                    {tabs.map((tab, index) =>
                        <div key={`tab-content-${index}`} className={cx('cue-tabs__item', {
                            'is-active': index === this.state.activeIndex,
                        })}>{tab.children}
                        </div>
                    )}
                </div>
            </div>
        )
    }

    private onOptionClick(event: MouseEvent, tab: TabProps, option: DropdownItem) {
        event.preventDefault();

        tab.onOptionSelect({
            groupId: tab.groupId,
            selected: option,
        });

        this.setState({ activeMenu: null });
    }

    private onFormatClick(event: MouseEvent, tab: TabProps) {
        console.log('format click');
        event.preventDefault();

        tab.onFormatClick();

        this.setState({ activeMenu: null });
    }
}
