import * as React from 'react';
import { CUEVersion } from '@config/gen_cuelang_org_go_version';
import { mainNav } from '@config/nav';
import { WORKSPACE, Workspace, Workspaces } from '@models/workspace';
import { DropdownChange } from '@models/dropdown';
import { Menu } from '@components/menu';
import { Share } from '@components/share';
import { WorkspaceMenu } from '@components/workspace-menu';
import { ExamplesMenu } from '@components/examples-menu';
import { Example } from '@models/example';

interface HeaderProps {
    activeExample?: Example;
    activeWorkspaceName: WORKSPACE;
    workspaces: Workspaces;
    saved: boolean;
    showSaveURL: boolean;
    share: {(): void};
    handleOptionsChange: {(changes: DropdownChange[]): void};
    switchWorkspace: {(workspace: Workspace): void};
    onDropdownSelect?: {(change: DropdownChange): void};
}

interface HeaderState {
    examplesMenuOpen: boolean;
    workspaceMenuOpen: boolean;
}

export class Header extends React.Component<HeaderProps, HeaderState>
{

    constructor(props: HeaderProps) {
        super(props);
        this.state = {
            examplesMenuOpen: false,
            workspaceMenuOpen: false,
        }
    }

    public render() {
        const activeWorkspace = this.props.workspaces[this.props.activeWorkspaceName];

        return (
            <header className="cue-header">
                <a href="/" className="cue-header__logo" rel="home">
                    <svg width="50" height="50" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg">
                        <path d="M 24.999983,0 C 11.199983,0 1.7e-5,11.19 1.7e-5,25 c 0,13.81 11.189966,25 24.999966,25 13.81,0 25,-11.19 25,-25 0,-13.81 -11.19,-25 -25,-25 z m 0,47.59 c -12.48,0 -22.58997,-10.12 -22.58997,-22.59 0,-12.47 10.11997,-22.6 22.58997,-22.6 12.47,0 22.59,10.12 22.59,22.59 0,12.47 -10.12,22.59 -22.59,22.59 z"/>
                        <path className="cue-header__logo-inner" d="m 25.000283,3.74023 c -11.74,0 -21.26003,9.51997 -21.26003,21.25997 0,11.74 9.52003,21.26 21.26003,21.26 11.74,0 21.26,-9.52 21.26,-21.26 0,-11.74 -9.52,-21.25997 -21.26,-21.25997 z m 0,41.39997 c -11.12,0 -20.14003,-9.02 -20.14003,-20.14 0,-11.12 9.02003,-20.13997 20.14003,-20.13997 11.12,0 20.14,9.01997 20.14,20.13997 0,11.12 -9.02,20.14 -20.14,20.14 z"/>
                        <path d="m 18.319383,26.9101 c -0.24,1.17 -1.22,1.9 -2.55,1.9 -1.81,0 -2.97,-1.46 -2.97,-3.71 0,-2.25 1.17,-3.71 2.98,-3.71 1.33,0 2.31,0.74 2.54,1.93 l 0.03,0.16 h 2.01 l -0.04,-0.23 c -0.36,-2.24 -2.15,-3.69 -4.56,-3.69 -2.96,0 -4.94,2.23 -4.94,5.54 0,3.31 1.99,5.54 4.94,5.54 2.36,0 4.19,-1.47 4.56,-3.65 l 0.04,-0.23 h -2.01 z M 30.999083,30.5 V 19.71 h 7.42 v 1.75 h -5.43 v 2.77 h 5.09 v 1.74 h -5.09 v 2.78 h 5.49 v 1.75 z m -5.4997,0.18 c -2.62,0 -4.39,-1.56 -4.39,-3.89 v -7.08 h 1.99 v 7.05 c 0,1.03 0.74,2.07 2.4,2.07 1.66,0 2.4,-1.04 2.4,-2.07 v -7.05 h 1.99 v 7.08 c 0,2.33 -1.77,3.89 -4.39,3.89 z"/>
                    </svg>
                    <span>Homepage of CUE</span>
                </a>

                <div className="cue-header__section">
                    <Menu id="workspace"
                          icon={ activeWorkspace.icon }
                          cssClass='cue-menu--wide'
                          type="icon-mobile"
                          title={ activeWorkspace.title }
                          open={ this.state.workspaceMenuOpen }
                          onOpen={ () => {
                              this.setState({ workspaceMenuOpen: true })
                          } }
                          onClose={ () => {
                              this.setState({ workspaceMenuOpen: false })
                          } }
                    >
                        <WorkspaceMenu
                            activeWorkspace={ activeWorkspace }
                            workspaces={ this.props.workspaces }
                            onDropdownSelect={ this.props.onDropdownSelect.bind(this) }
                            onClose={ () => { this.setState({ workspaceMenuOpen: false })} }
                        ></WorkspaceMenu>
                    </Menu>
                    <Menu id="examples"
                          title="Examples"
                          cssClass="cue-menu--wide"
                          onOpen={ () => {
                              this.setState({ examplesMenuOpen: true })
                          } }
                          onClose={ () => {
                              this.setState({ examplesMenuOpen: false })
                          } }
                    >
                        <ExamplesMenu
                            activeExample={ this.props.activeExample }
                            onClose={ () => { this.setState({ examplesMenuOpen: false })} }
                        ></ExamplesMenu>
                    </Menu>
                </div>

                <div className="cue-header__section cue-header__section--menu">
                    <Share saved={ this.props.saved }
                           showSaveURL={ this.props.showSaveURL }
                           share={ this.props.share }
                           disabled={ activeWorkspace.type !== WORKSPACE.FUNC }
                    ></Share>

                    <Menu cssClass="cue-menu--right cue-menu--transparent"
                          icon="dots-vertical" id="menu" title="Menu" type="icon">
                        <div className="cue-menu__header">
                            <p className="cue-menu__title">CUE Playground</p>
                            <p className="cue-menu__subtitle">CUE Release: { CUEVersion }</p>
                        </div>
                        <div className="cue-menu__content">
                            <ul className="cue-nav">
                                { mainNav.map((navItem) => {
                                    return (
                                        <li className="cue-nav__item" key={ navItem.url }>
                                            <a className="cue-nav__link" href={ navItem.url }>
                                                <span className="cue-nav__text">{ navItem.title }</span>
                                            </a>
                                        </li>
                                    )
                                }) }
                            </ul>
                        </div>
                    </Menu>
                </div>
            </header>
        );
    }
}
