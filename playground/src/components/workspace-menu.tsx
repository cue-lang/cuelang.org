import * as React from 'react';
import cx from 'classnames';
import { Dropdown } from './dropdown';
import { Icon } from './icon';
import { availableWorkspaces } from '@config/workspaces';
import { DropdownChange } from '@models/dropdown';
import { OPTION_TYPE } from '@models/options';
import { Workspace, Workspaces } from '@models/workspace';
import { workspaceToHashParams } from '@helpers/hash-params';

interface WorkspaceMenuProps {
    activeWorkspace: Workspace;
    workspaces: Workspaces;
    onDropdownSelect?: {(change: DropdownChange): void};
    onClose?: () => void;
}

export class WorkspaceMenu extends React.Component<WorkspaceMenuProps> {
    constructor(props: WorkspaceMenuProps) {
        super(props);
    }

    public getFuncOptions() {
        // We need to filter the func options if filters is enabled and we have a value for option type 'input'
        const activeInput = this.props.activeWorkspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.INPUT)?.selected?.value;
        const funcConfig = this.props.activeWorkspace.config.func;
        return funcConfig.enabled && activeInput ? funcConfig.options.filter((option) => {
            return !(option.value === 'def' && activeInput !== 'cue');
        }) : [];
    }

    public switchWorkspace(workspace: Workspace) {
        if (workspace.type !== this.props.activeWorkspace.type) {
            window.location.hash = workspaceToHashParams(workspace);
        }
    }

    public render() {
        const activeWorkspace = this.props.activeWorkspace;
        const workspaces = Object.values(availableWorkspaces) as Workspace[];
        const funcOption = activeWorkspace.config.func;
        const outputTab = activeWorkspace.config.outputTab;

        return (
            <div className="cue-ws-menu">
                <div className="cue-ws-menu__section">
                    <p className="cue-ws-menu__title">Workspaces</p>

                    <ul className="cue-ws-menu__items">
                        { workspaces.map((workspace) => {
                            const isActive = workspace.type === activeWorkspace.type;
                            const buttonClasses = cx({
                                'is-active': isActive,
                                'cue-button--blue': isActive,
                                'cue-button--transparent': !isActive,
                            }, 'cue-button', 'cue-ws-menu__button');

                            return (
                                <li className="cue-ws-menu__item" key={ workspace.type }>
                                    <button
                                        className={ buttonClasses }
                                        disabled={ !workspace.enabled }
                                        onClick={ () => this.switchWorkspace(workspace) }
                                    >
                                         <span className="cue-button__icon cue-ws-menu__icon">
                                            <Icon icon={ workspace.icon }></Icon>
                                        </span>
                                        <span className="cue-button__text">{ workspace.title }</span>
                                    </button>
                                </li>
                            );
                        }) }
                    </ul>
                </div>
                <div className="cue-ws-menu__section cue-ws-menu__section--active">
                    <p className="cue-ws-menu__title">{ activeWorkspace.title }</p>
                    <p className="cue-ws-menu__description">{ activeWorkspace.description }</p>

                    <div className="cue-ws-menu__config">
                        <p className="cue-ws-menu__title cue-ws-menu__title--options">Options</p>
                        <ul className="cue-ws-menu__options">
                            { activeWorkspace.config.inputTabs.map(tab => {
                                return (
                                    <li className="cue-ws-menu__option"
                                        key={ `menu-${ activeWorkspace.type }-${ tab.type }` }
                                    >
                                        <p className="cue-ws-menu__label">{ tab.title }</p>
                                        { <Dropdown
                                            cssClass="cue-ws-menu__dropdown"
                                            groupId={ tab.type }
                                            activeItem={ tab.selected }
                                            items={ tab.options }
                                            onDropdownSelect={ this.props.onDropdownSelect }
                                        ></Dropdown> }
                                    </li>
                                );
                            })}

                            { funcOption.enabled &&
                                <li className="cue-ws-menu__option" key="workspaceFunction">
                                    <p className="cue-ws-menu__label">Function</p>
                                    { <Dropdown
                                        cssClass="cue-ws-menu__dropdown"
                                        groupId={ OPTION_TYPE.FUNC }
                                        activeItem={ funcOption.selected }
                                        items={ this.getFuncOptions() }
                                        onDropdownSelect={ this.props.onDropdownSelect }
                                    ></Dropdown> }
                                </li>
                            }

                            <li className="cue-ws-menu__option" key="workspaceOutput">
                                <p className="cue-ws-menu__label">Output</p>
                                { <Dropdown
                                    cssClass="cue-ws-menu__dropdown"
                                    groupId={ outputTab.type }
                                    readonly={ outputTab.optionsReadonly }
                                    disabled={ funcOption.enabled && funcOption.selected.value === 'def' }
                                    activeItem={ outputTab.selected }
                                    items={ outputTab.options }
                                    onDropdownSelect={ this.props.onDropdownSelect }
                                ></Dropdown> }
                            </li>
                        </ul>

                        <div className="cue-ws-menu__footer">
                            <button className="cue-button cue-button--grey-outline cue-ws-menu__submit"
                                    type="button" onClick={ this.props.onClose }>OK
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}
