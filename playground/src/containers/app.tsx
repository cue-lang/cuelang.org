// Copyright 2020 CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import { LanguageName, loadLanguage } from '@uiw/codemirror-extensions-langs';
import CodeMirror, { basicSetup, EditorView, Extension } from '@uiw/react-codemirror';
import { debounce } from 'lodash';
import * as React from 'react';

import { Header } from '@components/header';
import { Spinner } from '@components/spinner';
import { Tab } from '@components/tab';
import { Tabs } from '@components/tabs';
import { vscodeLight, vscodeLightTerminal } from '@config/editor-theme';
import { examples } from '@config/examples';
import { availableWorkspaces, defaultWorkspace } from '@config/workspaces';
import { getSharedCode, share, workspaceToShareContent } from '@helpers/share';
import { getHashParamsFromUrl, getSearchParamsFromUrl, updateHash, workspaceToHashParams } from '@helpers/url-params';
import { setupWorkspaceConfig } from '@helpers/workspace';
import { DropdownChange } from '@models/dropdown';
import { Example } from '@models/example';
import { HASH_KEY, hashParams } from '@models/hashParams';
import { OPTION_TYPE } from '@models/options';
import { WORKSPACE, Workspace, Workspaces } from '@models/workspace';

interface AppProps
{
    WasmAPI: WasmAPI;
}

interface AppState
{
    activeWorkspaceName: WORKSPACE;
    workspaces: Workspaces;
    loading: boolean;
    saved: boolean;
    showSaveURL: boolean;
    activeExample?: Example;
}

// App is the root of our React application
export class App extends React.Component<AppProps, AppState>
{
    private inputEditors: { [key: string ]: EditorView } = {};
    private outputEditor: EditorView;

    constructor(props: AppProps) {
        super(props);

        this.state = {
            activeWorkspaceName: WORKSPACE.FUNC,
            workspaces: availableWorkspaces,
            loading: true,
            saved: false,
            showSaveURL: false,
            activeExample: null,
        };
    }

    public async componentDidMount() {
        window.addEventListener('hashchange', this.updatePlayground.bind(this));
        window.addEventListener('resize', this.onWindowResize.bind(this));

        this.props.WasmAPI.OnChange(this.updateOutput.bind(this));

        await this.loadPlayground();
    }

    public componentWillUnmount() {
        window.removeEventListener('hashchange', this.updatePlayground.bind(this));
        window.removeEventListener('resize', this.onWindowResize.bind(this));
    }

    public async loadPlayground() {
        let activeWorkspace: Workspace;
        let activeExample: Example = null;
        let saved = false;
        const urlSearchParams = getSearchParamsFromUrl();
        const params: hashParams = getHashParamsFromUrl();
        const defaultCUEInput = 'intro-welcome-to-cue';

        // Check if we have saved code to get
        const id = urlSearchParams.get('id');
        if (id != null && id != '') {
            const sharedCode = await getSharedCode(id);
            if (sharedCode) {
                saved = true;
                activeWorkspace = availableWorkspaces[sharedCode.workspace] ?? defaultWorkspace;
                for (const savedInput of sharedCode.inputs) {
                    const inputTab = activeWorkspace.config.inputTabs.find(tab => tab.type = savedInput.type);
                    if (inputTab) {
                        inputTab.code = savedInput.code;
                    }
                }
            }
        }

        // If we don't have saved code: check for example param in the url
        if (!saved) {
            const exampleSlug = urlSearchParams.get('example');
            if (exampleSlug) {
                const example = examples.find(item => item.slug === exampleSlug);
                if (example) {
                    activeWorkspace = availableWorkspaces[example.workspace];
                    activeWorkspace.config = example.workspaceConfig;
                    activeExample = example;
                } else {
                    // Remove example from searchparams when it's not a valid example
                    urlSearchParams.delete('example');
                }
            } else { // If we don't have an example, default to displaying a specific example's content
                const example = examples.find(item => item.slug === defaultCUEInput);
                if (example) {
                    activeWorkspace = availableWorkspaces[example.workspace];
                    activeWorkspace.config = example.workspaceConfig;
                }
            }
        }

        // If no workspace is set from saved code: get from params
        if (!activeWorkspace && params[HASH_KEY.WORKSPACE]) {
            const workspaceKey = params[HASH_KEY.WORKSPACE] as WORKSPACE;
            activeWorkspace = availableWorkspaces[workspaceKey];
        }

        // If still no workspace set, or selected workspace is not enabled: use default
        if (!activeWorkspace || !activeWorkspace.enabled) {
            activeWorkspace = defaultWorkspace;
        }

        // Setup workspace config from url params
        activeWorkspace = setupWorkspaceConfig(activeWorkspace, params);

        // Update active workspace in workspaces array
        const workspaces = this.state.workspaces;
        workspaces[activeWorkspace.type] = activeWorkspace;

        // Update hash because params might have changed because of validation rules
        this.updateHash(activeWorkspace, true);

        // Update state
        this.setState({
            activeWorkspaceName: activeWorkspace.type,
            workspaces: workspaces,
            saved: saved,
            loading: false,
            activeExample: activeExample,
        }, this.updateOutput.bind(this));
    }

    public updatePlayground() {
        const params: hashParams = getHashParamsFromUrl();

        // Get current active workspace from state
        let activeWorkspace = this.state.workspaces[this.state.activeWorkspaceName];
        const workspaces = this.state.workspaces;

        // Check if we need to switch workspace
        const workspaceParam = params[HASH_KEY.WORKSPACE];
        if (workspaceParam && Object.values<string>(WORKSPACE).includes(workspaceParam) &&
            workspaceParam !== this.state.activeWorkspaceName) {
            // Get new active workspace from all saved workspaces in state
            const newActiveWorkspace = this.state.workspaces[workspaceParam as WORKSPACE];

            // If new workspace does not exist or is not enabled: do nothing
            if (!newActiveWorkspace || !newActiveWorkspace.enabled) {
                return;
            }

            // Set state to loading because we're going to start setting up the workspace
            this.setState({
                loading: true,
            });

            // Save code from editors in current active workspace
            if (this.inputEditors) {
                for (const inputTab of activeWorkspace.config.inputTabs) {
                    const editorId = `${ activeWorkspace.type }-${ inputTab.type }`;
                    const editor = this.inputEditors[editorId];
                    inputTab.code = editor ? editor.state.doc.toString() : '';
                }

                // Update workspace in workspaces array
                workspaces[activeWorkspace.type] = activeWorkspace;
            }

            // Update hash because params might have changed because of workspace config
            this.updateHash(newActiveWorkspace, true);

            // Update state + update output after
            this.setState({
                activeWorkspaceName: newActiveWorkspace.type,
                workspaces: workspaces,
                loading: false,
            }, this.updateOutput.bind(this));

        } else { // Same workspace but params changed:
            const params: hashParams = getHashParamsFromUrl();
            // Setup workspace config again with new params
            activeWorkspace = setupWorkspaceConfig(activeWorkspace, params);
            workspaces[activeWorkspace.type] = activeWorkspace;

            // Update hash because params might have changed because of validation rules
            this.updateHash(activeWorkspace, true);

            // Update state + update output after
            this.setState({
                workspaces: workspaces,
            }, this.updateOutput.bind(this));
        }
    }

    public updateHash(workspace: Workspace, replace = false) {
        const newHash = workspaceToHashParams(workspace);
        updateHash(newHash, replace);
    }

    public render() {
        const activeWorkspace = this.state.workspaces[this.state.activeWorkspaceName];
        const funcTab = activeWorkspace.config.func;
        const outputTab = activeWorkspace.config.outputTab;

        return (
            <div className={ `cue-playground cue-playground--${ activeWorkspace.type }` }>
                <div className="cue-playground__header">
                    <Header
                        activeExample={ this.state.activeExample }
                        activeWorkspaceName={ this.state.activeWorkspaceName }
                        workspaces={ this.state.workspaces }
                        saved={ this.state.saved }
                        showSaveURL={ this.state.showSaveURL }
                        share={ this.share.bind(this) }
                        handleOptionsChange={ this.handleOptionsChange.bind(this) }
                        onDropdownSelect={ this.handleDropdownChange.bind(this) }
                        switchWorkspace={ this.switchWorkspace.bind(this) }
                    ></Header>
                </div>
                <div className="cue-playground__content">
                    { this.state.loading &&
                        <Spinner className="cue-playground__spinner"></Spinner>
                    }

                    { !this.state.loading &&
                        <div className="cue-columns">
                            <div className="cue-columns__item">
                                { activeWorkspace.config.inputTabs.map((tab) => {
                                    const id = `${ activeWorkspace.type }-${ tab.type }`;
                                    return (
                                        <div className="cue-columns__subitem" key={ id }>
                                            <Tabs>
                                                <Tab
                                                    activeItem={ tab.selected }
                                                    groupId={ tab.type }
                                                    items={ tab.options }
                                                    readonly={ tab.optionsReadonly }
                                                    onDropdownSelect={ this.handleDropdownChange.bind(this) }
                                                    name={ tab.title }
                                                >
                                                    <CodeMirror
                                                        className="cue-editor"
                                                        theme={ vscodeLight }
                                                        value={ tab.code ?? '' }
                                                        basicSetup={ false }
                                                        extensions={ this.getExtensions(tab.selected.value) }
                                                        onCreateEditor={ async (view) => {
                                                            this.inputEditors[id] = view;
                                                            this.updateOutput();
                                                        } }
                                                        onChange={ this.onEditorInputChange.bind(this) }
                                                    />
                                                </Tab>
                                            </Tabs>
                                        </div>
                                    );
                                }) }
                            </div>
                            <div className="cue-columns__item">
                                <Tabs>
                                    <Tab
                                        activeItem={ outputTab.selected }
                                        groupId={ outputTab.type }
                                        items={ outputTab.options }
                                        readonly={ outputTab.optionsReadonly || (funcTab.enabled && funcTab.selected.value !== 'export') }
                                        onDropdownSelect={ this.handleDropdownChange.bind(this) }
                                        name={ outputTab.title }
                                        type="output"
                                    >

                                        <CodeMirror
                                            className="cue-editor cue-editor--terminal"
                                            theme={ vscodeLightTerminal }
                                            placeholder="// ... loading WASM"
                                            basicSetup={ false }
                                            editable={ false }
                                            extensions={ this.getExtensions( outputTab.selected.value) }
                                            onCreateEditor={ async(view) => {
                                                this.outputEditor = view;
                                                this.updateOutput();
                                            } }
                                        />
                                    </Tab>
                                </Tabs>
                            </div>
                        </div>
                    }
                </div>
            </div>
        );
    }

    private onWindowResize = debounce(() => {
        this.resetEditorLayout();
    }, 300);

    private onEditorInputChange(): void {
        if (this.state.saved) {
            window.history.pushState({}, 'CUE Playground', '?id=' + window.location.hash)
            this.setState({ saved: false, showSaveURL: false });
        }

        this.updateOutput();
    }

    private switchWorkspace(workspace: Workspace): void {
        if (workspace.enabled) {
            const newActiveWorkspace = this.state.workspaces[workspace.type as WORKSPACE];
            this.updateHash(newActiveWorkspace);
        }
    }

    private handleOptionsChange(changes: DropdownChange[]): void {
        const activeWorkspace = this.state.workspaces[this.state.activeWorkspaceName];

        for (const change of changes) {
            if (Object.values<string>(OPTION_TYPE).includes(change.groupId)) {
                if (change.groupId === OPTION_TYPE.FUNC && activeWorkspace.config.func.enabled) {
                    activeWorkspace.config.func.selected = change.selected;
                } else if (change.groupId === OPTION_TYPE.OUTPUT) {
                    activeWorkspace.config.outputTab.selected = change.selected;
                } else {
                    const inputTab = activeWorkspace.config.inputTabs.find(tab => tab.type === change.groupId);
                    if (inputTab) {
                        inputTab.selected = change.selected;
                    }
                }
            }
        }

        this.updateHash(activeWorkspace);
    }

    private handleDropdownChange(change: DropdownChange): void {
        this.handleOptionsChange([ change ]);
    }

    public resetEditorLayout(): void {
        if (this.inputEditors) {
            for (const inputEditor of Object.values(this.inputEditors)) {
                inputEditor.requestMeasure();
            }
        }

        if (this.outputEditor) {
            this.outputEditor.requestMeasure();
        }
    }

    private updateOutput(): void {
        const activeWorkspace = this.state.workspaces[this.state.activeWorkspaceName];

        if (this.props.WasmAPI.CUECompile === undefined ||
            this.inputEditors === undefined || this.outputEditor === undefined) {
            return;
        }

        /* TODO: this part is just to make current function workspace output to keep working with the new setup
    but it will be replaced by a dynamic setup for all workspaces: see commented out code below */
        /* START OF (OLD) FUNCTION CODE */
        const inputTab = activeWorkspace.config.inputTabs.find(tab => tab.type === OPTION_TYPE.INPUT);
        const func = activeWorkspace.config.func.enabled ? activeWorkspace.config.func.selected.value : 'export';
        const output = activeWorkspace.config.outputTab.optionsReadonly ? 'cue' : activeWorkspace.config.outputTab.selected.value;
        const editorId = `${ activeWorkspace.type }-${ inputTab.type }`;
        const inputEditor = this.inputEditors[editorId];
        const pre = inputEditor ? inputEditor.state.doc.toString() : '';
        const result = this.props.WasmAPI.CUECompile(inputTab?.selected.value, func, output, pre);

        let val = result.error;
        if (val === '') {
            val = result.value;
        }

        const transaction = this.outputEditor.state.update({
            changes: { from: 0, to: this.outputEditor.state.doc.length, insert: val },
        });
        this.outputEditor.dispatch(transaction);
        this.outputEditor.dispatch({ selection: { anchor: 0 } });
        /* END OF FUNCTION CODE */


        // TODO: New implementation: can be uncommented when wasm part is ready
        /* START OF NEW CODE */
        // const config: WasmConfig = workspaceToWasmConfig(activeWorkspace, this.inputEditors);
        // const result: CUECompileResponse = this.props.WasmAPI.CUECompile(config);
        // if (result.outputType !== activeWorkspace.config.outputTab.selected.value)  {
        //     // Update output language for state if it changed because of result
        //     const newOutputOption = allOptions.find(option => option.value === result.outputType);
        //     if (newOutputOption) {
        //         activeWorkspace.config.outputTab.selected = newOutputOption;
        //         // Update hash to reflect changes in url & ui
        //         this.updateHash(activeWorkspace);
        //     }
        // }
        //
        // const transaction = this.outputEditor.state.update({
        //     changes: { from: 0, to: this.outputEditor.state.doc.length, insert: result.output },
        // });
        // this.outputEditor.dispatch(transaction);
        // this.outputEditor.dispatch({ selection: { anchor: 0 } });
        /* END OF NEW CODE */

    }

    private async share(): Promise<void> {
        const activeWorkspace = this.state.workspaces[this.state.activeWorkspaceName];
        const contents = workspaceToShareContent(activeWorkspace, this.inputEditors);
        const data = await share(contents);
        if (data) {
            window.history.pushState({}, 'CUE Playground', '?id=' + data + window.location.hash);
            this.setState({ ...this.state, saved: true, showSaveURL: true });
        }
    }

    private getExtensions(languageValue: string): Extension[] {
        const extensions = basicSetup({
            highlightActiveLine: false,
            highlightActiveLineGutter: false,
        });

        const language = loadLanguage(languageValue as LanguageName);
        if (language) {
            extensions.push(language);
        }

        return extensions;
    }
}
