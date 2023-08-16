import * as React from 'react';
import { JSXElementConstructor, MouseEvent, PropsWithChildren } from 'react';
import cx from 'classnames';
import { Dropdown } from '@components/dropdown';
import { Tab, TabProps } from '@components/tab';

interface TabsProps {
    activeIndex?: number;
}

interface TabsState {
    activeIndex: number;
}

export class Tabs extends React.Component<PropsWithChildren<TabsProps>, TabsState> {
    constructor(props: PropsWithChildren<TabsProps>) {
        super(props);

        this.state = {
            activeIndex: props.activeIndex ?? 0,
        };
    }

    public selectTab(e: MouseEvent, index: number) {
        e.preventDefault();
        this.setState({ activeIndex: index });
    }

    public render () {
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
                        { tabs.map((tab, index) => {
                            const isActive = index === this.state.activeIndex;
                            const tabName = `${ tab.name ? (tab.name + ': ') : ''}${ tab.activeItem.name ?? ''}`;
                            const tabClassNames = cx({
                                'is-active': isActive,
                                'cue-tabs-nav__tab--output': tab.type === 'output',
                            }, 'cue-tabs-nav__tab');

                            return (
                                <li className="cue-tabs-nav__item" key={`tab-${ tab.groupId }`}>
                                    { (isActive && tab.items && tab.items.length > 1) &&
                                        <div className={ tabClassNames }
                                        >
                                            <Dropdown
                                                activeItem={ tab.activeItem }
                                                cssClass="cue-tabs-nav__dropdown cue-dropdown--tab"
                                                readonly={ tab.readonly }
                                                disabled={ tab.disabled }
                                                disabledText={ tab.disabledText }
                                                groupId={ tab.groupId }
                                                items={ tab.items}
                                                name={ tab.name }
                                                onDropdownSelect={ tab.onDropdownSelect }
                                                open={ tab.open }
                                            ></Dropdown>
                                        </div>
                                    }
                                    { (!isActive || !tab.items || tab.items.length <= 1) &&
                                        <button
                                            disabled={ tab.disabled }
                                            className={ cx('cue-tabs-nav__tab', {
                                                'is-active': isActive,
                                                'cue-tabs-nav__tab--output': tab.type === 'output',
                                            }) }
                                            onClick={ (e) => this.selectTab(e, index) }
                                        ><span className="cue-tabs-nav__text">{ tabName }</span></button>
                                    }
                                </li>
                            )
                        })}
                    </ul>
                </div>

                <div className="cue-tabs__content">
                    { tabs.map((tab, index) =>
                        <div key={`tab-content-${ index }`} className={ cx('cue-tabs__item', {
                            'is-active': index === this.state.activeIndex,
                        }) }>{ tab.children }
                        </div>
                    )}
                </div>
            </div>
        )
    }
}
