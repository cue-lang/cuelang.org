import * as React from 'react';
import { MutableRefObject } from 'react';
import { Workspace } from '../models/workspace';
import { funcOptions, inputOptions, Option, OPTION_TYPE, outputOptions } from '../models/options';
import { Dropdown } from './dropdown';
import { workspaces } from '../config/workspaces';
import { DropdownChange } from '../models/dropdown';
import { Icon } from './icon';
import cx from 'classnames';

interface WorkspaceMenuProps {
    activeWorkspace: Workspace;
    activeInput: Option;
    activeFunc: Option;
    activeOutput: Option;
    handleOptionsChange: { (changes: DropdownChange[]): void };
    switchWorkspace: { (workspace: Workspace): void };
}

interface WorkspaceMenuState {
    [OPTION_TYPE.INPUT]: Option,
    [OPTION_TYPE.FUNC]: Option,
    [OPTION_TYPE.OUTPUT]: Option,
    filteredFuncOptions: Option[],
}

export class WorkspaceMenu extends React.Component<WorkspaceMenuProps, WorkspaceMenuState> {
    public menuRef: MutableRefObject<HTMLDivElement>;

    constructor(props: WorkspaceMenuProps) {
        super(props);

        this.menuRef = React.createRef();

        const filteredFuncOptions: Option[] = funcOptions.filter((option) => {
            return !(option.value === 'def' && this.props.activeInput.value !== 'cue');
        });

        this.state = {
            [OPTION_TYPE.INPUT]: this.props.activeInput,
            [OPTION_TYPE.FUNC]: this.props.activeFunc,
            [OPTION_TYPE.OUTPUT]: this.props.activeOutput,
            filteredFuncOptions: filteredFuncOptions,
        };
    }

    public componentDidUpdate(prevProps: WorkspaceMenuProps) {
        if (prevProps.activeInput !== this.props.activeInput) {
            this.handleInputChange(this.props.activeInput);
        }

        if (prevProps.activeFunc !== this.props.activeFunc) {
            this.handleFuncChange(this.props.activeFunc);
        }

        if (prevProps.activeOutput !== this.props.activeOutput) {
            this.handleOutputChange(this.props.activeOutput);
        }
    }

    public render() {
        const activeWorkspace = this.props.activeWorkspace;

        return (
            <div className="cue-ws-menu" ref={ this.menuRef }>
                <div className="cue-ws-menu__section">
                    <p className="cue-ws-menu__title">Workspaces</p>

                    <ul className="cue-ws-menu__items">
                        { workspaces.map((workspace) => {
                            const isActive = workspace.name === activeWorkspace.name;
                            const buttonClasses = cx({
                                'is-active': isActive,
                                'cue-button--blue': isActive,
                                'cue-button--transparent': !isActive,
                            }, 'cue-button', 'cue-ws-menu__button');

                            return (
                                <li className="cue-ws-menu__item" key={ workspace.name }>
                                    <button
                                        className={ buttonClasses }
                                        disabled={ !workspace.enabled }
                                        onClick={ () => this.props.switchWorkspace(workspace) }
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

                    {/* TODO: Render everything from activeWorkspace
                    when we're going to implement multiple workspaces/policy workspace*/ }
                    <form className="cue-ws-menu__config" onSubmit={ this.handleSubmit.bind(this) }>
                        <p className="cue-ws-menu__title cue-ws-menu__title--options">Options</p>
                        <ul className="cue-ws-menu__options">
                            <li className="cue-ws-menu__option" key="workspaceInput">
                                <label htmlFor={ `workspace-${ OPTION_TYPE.INPUT }` } className="cue-ws-menu__label">
                                    Input
                                </label>
                                <input type="hidden"
                                       name={ OPTION_TYPE.INPUT }
                                       id={ `workspace-${ OPTION_TYPE.INPUT }` }
                                       value={ this.state.input.value }/>
                                { <Dropdown
                                    cssClass="cue-ws-menu__dropdown"
                                    id={ OPTION_TYPE.INPUT }
                                    activeItem={ this.state.input }
                                    items={ inputOptions }
                                    onDropdownSelect={ this.handleDropdownChange.bind(this) }
                                ></Dropdown> }
                            </li>
                            <li className="cue-ws-menu__option" key="workspaceFunction">
                                <label htmlFor={ `workspace-${ OPTION_TYPE.FUNC }` } className="cue-ws-menu__label">
                                    Function
                                </label>
                                <input type="hidden"
                                       name={ OPTION_TYPE.FUNC }
                                       id={ `workspace-${ OPTION_TYPE.FUNC }` }
                                       value={ this.state.func.value }/>
                                { <Dropdown
                                    cssClass="cue-ws-menu__dropdown"
                                    id={ OPTION_TYPE.FUNC }
                                    activeItem={ this.state.func }
                                    items={ this.state.filteredFuncOptions }
                                    onDropdownSelect={ this.handleDropdownChange.bind(this) }
                                ></Dropdown> }
                            </li>
                            <li className="cue-ws-menu__option" key="workspaceOutput">
                                <label htmlFor={ `workspace-${ OPTION_TYPE.OUTPUT }` } className="cue-ws-menu__label">
                                    Output
                                </label>
                                <input type="hidden"
                                       id={ `workspace-${ OPTION_TYPE.OUTPUT }` }
                                       name={ OPTION_TYPE.OUTPUT }
                                       value={ this.state.output.value }/>
                                { <Dropdown
                                    cssClass="cue-ws-menu__dropdown"
                                    id={ OPTION_TYPE.OUTPUT }
                                    disabled={ this.state[OPTION_TYPE.FUNC].value == 'def' }
                                    activeItem={ this.state.output }
                                    items={ outputOptions }
                                    onDropdownSelect={ this.handleDropdownChange.bind(this) }
                                ></Dropdown> }
                            </li>
                        </ul>

                        <div className="cue-ws-menu__footer">
                            <button className="cue-button cue-button--grey-outline cue-ws-menu__submit"
                                    type="submit">OK
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        );
    }

    private handleDropdownChange(change: DropdownChange) {
        switch (change.groupId) {
            case OPTION_TYPE.INPUT:
                this.handleInputChange(change.selected);
                break;
            case OPTION_TYPE.FUNC:
                this.handleFuncChange(change.selected);
                break;
            case OPTION_TYPE.OUTPUT:
                this.handleOutputChange(change.selected);
                break;
        }
    }

    private handleSubmit(event: React.FormEvent<HTMLFormElement>): void {
        event.preventDefault();
        const changes: DropdownChange[] = [
            { groupId: OPTION_TYPE.INPUT, selected: this.state[OPTION_TYPE.INPUT] },
            { groupId: OPTION_TYPE.FUNC, selected: this.state[OPTION_TYPE.FUNC] },
            { groupId: OPTION_TYPE.OUTPUT, selected: this.state[OPTION_TYPE.OUTPUT] },
        ]
        this.props.handleOptionsChange(changes);
    }

    private handleInputChange(inputOption: Option) {
        const filteredFuncOptions = funcOptions.filter((option) => {
            return !(option.value === 'def' && inputOption.value !== 'cue');
        });

        this.setState({
            [OPTION_TYPE.INPUT]: inputOption,
            filteredFuncOptions: filteredFuncOptions,
        });
    }

    private handleFuncChange(funcOption: Option) {
        const output: Option = funcOption.value === 'def' ? outputOptions.find(option => option.value === 'cue') : this.state.output;
        this.setState({
            [OPTION_TYPE.FUNC]: funcOption,
            [OPTION_TYPE.OUTPUT]: output,
        });
    }

    private handleOutputChange(outputOption: Option) {
        this.setState({ [OPTION_TYPE.OUTPUT]: outputOption });
    }
}
