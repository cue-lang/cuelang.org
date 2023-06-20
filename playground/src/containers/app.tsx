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

import * as React from 'react';
import { CUEVersion } from '@config/gen_cuelang_org_go_version';
import { Dropdown, DropdownItem } from '@components/dropdown';
import { funcOptions, inputOptions, Option, OPTION_TYPE, outputOptions } from '@models/options';
import { Tabs } from '@components/tabs';
import { Tab } from '@components/tab';
import { Editor } from '@monaco-editor/react';
import { editor } from 'monaco-editor';
import { editorOptions, outputEditorOptions } from '../config/monaco-editor';
import { debounce } from 'lodash';

interface AppProps
{
    WasmAPI: WasmAPI;
}

interface AppState
{
    readonly input: Option;
    readonly func: Option;
    readonly output: Option;
    readonly saved: boolean;
    readonly showSaveURL: boolean;
}

// App is the root of our React application
export class App extends React.Component<AppProps, AppState>
{
    public inputOptions: Option[] = inputOptions;
    public funcOptions: Option[] = funcOptions;
    public outputOptions: Option[] = outputOptions;

    private inputEditor: editor.IStandaloneCodeEditor;
    private outputEditor: editor.IStandaloneCodeEditor;
    private hashSeperator = '@';

    constructor(props: AppProps) {
        super(props);

        this.state = {
            input: undefined,
            func: undefined,
            output: undefined,
            saved: false,
            showSaveURL: false,
        };

        this.state = this.urlToState();
    }

    public componentDidMount() {
        window.addEventListener('hashchange', this.onUrlHashChange.bind(this));
        window.addEventListener("resize", this.onWindowResize.bind(this));

        this.props.WasmAPI.OnChange(this.updateOutput.bind(this));
    }

    public componentWillUnmount() {
        window.removeEventListener('hashchange', this.onUrlHashChange.bind(this));
        window.removeEventListener("resize", this.onWindowResize.bind(this));
    }

    public render() {
        const inputDropdownItems: DropdownItem[] = this.inputOptions.map((option) => {
            return { value: option.value, name: option.name };
        });

        const funcDropdownItems: DropdownItem[] = this.funcOptions.filter((option) => {
            return !(option.value === 'def' && this.state.input.value !== 'cue');
        }).map((option) => {
            return { value: option.value, name: option.name }
        });

        const outputDropdownItems: DropdownItem[] = this.outputOptions.map((option) => {
            return { value: option.value, name: option.name };
        });

        return (
            <div className="cue-playground">
                <div className="cue-playground__header">
                    <ul className="cue-playground__controls">
                        <li className="cue-playground__controls-item">
                            { <Dropdown
                                id={ OPTION_TYPE.input }
                                activeTitle={ this.state.input.name }
                                buttonPrefix={ 'Input: '}
                                items={ inputDropdownItems }
                                onDropdownSelect={ this.handleDropdownChange.bind(this) }
                            ></Dropdown> }
                        </li>
                        <li className="cue-playground__controls-item">
                            { <Dropdown
                                id={ OPTION_TYPE.func }
                                items={ funcDropdownItems }
                                activeTitle={ this.state.func.name }
                                onDropdownSelect={ this.handleDropdownChange.bind(this) }
                            ></Dropdown> }
                        </li>
                        <li className="cue-playground__controls-item">
                            { <Dropdown
                                id={ OPTION_TYPE.output }
                                disabled={ this.state.func.value == 'def' }
                                activeTitle={ this.state.output.name }
                                buttonPrefix={ 'Output: ' }
                                items={ outputDropdownItems }
                                onDropdownSelect={ this.handleDropdownChange.bind(this) }
                            ></Dropdown> }
                        </li>
                        <li className="cue-playground__controls-item">
                            <div className="cue-share">
                                <button type="button"
                                        className="cue-button cue-share__button"
                                        disabled={ this.state.saved }
                                        onClick={ this.share.bind(this) }>
                                    Share
                                </button>
                                <input
                                    className="cue-share__input"
                                    style={ { display: (this.state.showSaveURL ? '' : 'none') } }
                                    readOnly={ true }
                                    id="shareURL"
                                    value={ window.location.toString() }/>
                            </div>
                        </li>
                    </ul>
                    <div className="cue-playground__version">{ CUEVersion }</div>
                </div>
                <div className="cue-playground__content">
                    <div className="cue-columns">
                        <div className="cue-columns__item cue-columns__item--left">
                            <Tabs>
                                <Tab name={ `Input: ${ this.state.input.name }` }>
                                    <Editor
                                        className="cue-editor"
                                        language={ this.state.input.value }
                                        options={ editorOptions }
                                        onMount={ async (editor) => {
                                            this.inputEditor = editor;
                                            await this.loadSavedCode();
                                            this.updateOutput();
                                        }}
                                        onChange={ this.onEditorInputChange.bind(this) }
                                    />
                                </Tab>
                            </Tabs>
                        </div>
                        <div className="cue-columns__item cue-columns__item--right">
                            <Tabs>
                                <Tab name={ `Output: ${ this.state.output.name }` } type="terminal">
                                    <Editor
                                        className="cue-editor cue-editor--terminal"
                                        language={ this.state.output.value }
                                        options={ outputEditorOptions }
                                        defaultValue="// ... loading WASM"
                                        onMount={ (editor) => {
                                            this.outputEditor = editor;
                                        }}
                                    />
                                </Tab>
                            </Tabs>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

    private onWindowResize = debounce(() => {
        this.resetEditorLayout();
    }, 300);

    private onUrlHashChange(): void {
        this.setState(this.urlToState(), this.updateOutput.bind(this));
    }

    private onEditorInputChange(): void {
        if (this.state.saved) {
            window.history.pushState({}, 'CUE Playground', '?id=' + window.location.hash)
            this.setState({ ...this.state, saved: false, showSaveURL: false });
        }
        this.updateOutput();
    }

    private urlToState(): AppState {
        // Get values from hash
        let hash = window.location.hash;
        if (hash.startsWith('#')) {
            hash = hash.slice(1);
        }
        const values = hash.split(this.hashSeperator);
        let inputValue = values[0]?.trim();
        let funcValue = values[1]?.trim();
        let outputValue = values[2]?.trim();

        // Validate if option from url is valid: if so use: otherwise use first option of array
        const inputOption = inputOptions.find(option => option.value === inputValue);
        const input = inputOption ?? inputOptions[0];

        const funcOption = funcOptions.find(option => option.value === funcValue);
        let func = funcOption ?? funcOptions[0];

        const outputOption = outputOptions.find(option => option.value === outputValue);
        let output = outputOption ?? outputOptions[0];

        // Validate if selected options work together: if not change them:

        /// if function is def but input is not cue: change func to export
        if (func.value === 'def' && input.value !== 'cue') {
            func = funcOptions.find(option => option.value === 'export');
        }

        // If function is def but output is not cue : set output to cue
        if (func.value === 'def' && output.value !== 'cue') {
            output = outputOptions.find(option => option.value === 'cue');
        }

        const urlOptions = {
            [OPTION_TYPE.input]: input.value,
            [OPTION_TYPE.func]: func.value,
            [OPTION_TYPE.output]: output.value,
        };

        // Update hash if parameters changed because of validation logic above
        if (input.value !== inputValue || func.value !== funcValue || output.value !== outputValue) {
            window.location.hash = `#${ Object.values(urlOptions).join(this.hashSeperator) }`;
        }

        // Return new state
        return { ...this.state, input: input, func: func, output: output };
    }

    private async loadSavedCode(): Promise<void> {
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get('id');

        if (id != null && id != '') {
            this.inputEditor.updateOptions({
                ...this.inputEditor.getOptions(),
                readOnly: true,
            });
            const url = `${ this.getShareUrl() }?id=${ id }`;

            try {
                const response = await fetch(url, { headers: { 'Content-Type': 'text/plain;' } });
                const data = await response.text();
                this.inputEditor.setValue(data);
                this.inputEditor.setSelection({
                    startLineNumber: 0, startColumn: 0, endLineNumber: 0, endColumn: 0
                });
                this.inputEditor.updateOptions({
                    ...this.inputEditor.getOptions(),
                    readOnly: false,
                });
                this.setState({ ...this.state, saved: true });
            } catch (error) {
                this.inputEditor.updateOptions({
                    ...this.inputEditor.getOptions(),
                    readOnly: false,
                });
                console.log('Error loading snippet with id=' + id, error);
            }
        }
    }

    private handleDropdownChange(groupId: string, value: string): void {
        const urlOptions: Record<keyof typeof OPTION_TYPE, string> = {
            [OPTION_TYPE.input]: this.state.input.value,
            [OPTION_TYPE.func]: this.state.func.value,
            [OPTION_TYPE.output]: this.state.output.value,
        }

        if (groupId in OPTION_TYPE) {
            urlOptions[groupId as keyof typeof OPTION_TYPE] = value;
        }

        window.location.hash = `#${ Object.values(urlOptions).join(this.hashSeperator) }`;
    }

    public resetEditorLayout(): void {
        this.inputEditor.layout({ width: 0, height: 0 });
        this.outputEditor.layout({ width: 0, height: 0 });
        this.inputEditor.layout();
        this.outputEditor.layout();
    }

    private getShareUrl(): string {
        const prefix = window.location.host.startsWith('localhost') ? 'http://localhost:8081' : '';
        return `${ prefix }/.netlify/functions/snippets`;
    }

    private updateOutput(): void {
        if (this.props.WasmAPI.CUECompile === undefined ||
            this.inputEditor === undefined || this.outputEditor === undefined) {
            return;
        }

        let pre = this.inputEditor.getValue();
        let post = this.props.WasmAPI.CUECompile(this.state.input.value, this.state.func.value, this.state.output.value, pre);
        let val = post.error;
        if (val === '') {
            val = post.value;
        }
        this.outputEditor.setValue(val);
        this.outputEditor.setSelection({
            startLineNumber: 0, startColumn: 0, endLineNumber: 0, endColumn: 0
        });
    }

    private share(): void {
        const contents = this.inputEditor.getValue();
        fetch(this.getShareUrl(), {
            method: 'POST',
            headers: { 'Content-Type': 'text/plain;' },
            body: contents,
        }).then((resp: Response) => {
            if (!resp.ok) {
                throw new Error(`Response status was not ok: ${ resp.status }`);
            }
            return resp.text();
        }).then((data: string) => {
            window.history.pushState({}, 'CUE Playground', '?id=' + data + window.location.hash)
            this.setState({ ...this.state, saved: true, showSaveURL: true });
        }).catch((error) => {
            console.log('Failed to share', error);
        });
    }
}
