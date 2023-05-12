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
import * as acemodule from 'ace-builds';
import { CUEVersion } from '@config/gen_cuelang_org_go_version';
import { Dropdown, DropdownItem } from '@components/dropdown';
import { funcOptions, inputOptions, Option, OPTION_TYPE, outputOptions } from '@models/options';

const editorFontSize = 15;

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
    private lhsEditor: acemodule.Ace.Editor;
    private rhsEditor: acemodule.Ace.Editor;
    private hashSeperator = '@';

    public inputOptions: Option[] = inputOptions;
    public funcOptions: Option[] = funcOptions;
    public outputOptions: Option[] = outputOptions;

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

    public async componentDidMount() {
        window.addEventListener('hashchange', this.onUrlHashChange.bind(this));
        this.props.WasmAPI.OnChange(this.updateOutput.bind(this));
        await this.loadEditor();
    }

    public componentWillUnmount() {
        window.removeEventListener('hashchange', this.onUrlHashChange.bind(this));
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
                <div className="cue-playground__column">
                    <div className="cue-playground__code" id="lhseditor"></div>
                </div>
                <div className="cue-playground__column">
                    <div className="cue-playground__code" id="rhseditor"></div>
                </div>
            </div>
        );
    }

    private async loadEditor(): Promise<void> {
        this.lhsEditor = acemodule.edit('lhseditor');
        this.lhsEditor.setHighlightActiveLine(false);
        this.lhsEditor.setShowPrintMargin(false);
        this.lhsEditor.on('change', (e: acemodule.Ace.Delta) => {
            this.inputDidChange();
        });
        this.lhsEditor.setFontSize(editorFontSize);
        this.lhsEditor.focus();

        let urlParams = new URLSearchParams(window.location.search);
        let id = urlParams.get('id');
        if (id != null && id != '') {
            this.lhsEditor.setReadOnly(true);
            const url = `${ this.urlPrefix() }'/.netlify/functions/snippets?id=${ id }`;
            try {
                const response = await fetch(url, { headers: { 'Content-Type': 'text/plain;' } });
                const data = await response.text();
                this.lhsEditor.setValue(data);
                this.lhsEditor.clearSelection();
                this.lhsEditor.setReadOnly(false);
                this.setState({ ...this.state, saved: true });
            } catch (error) {
                this.lhsEditor.setReadOnly(false);
                // TODO improve this
                console.log('Error loading snippet with id=' + id, error);
            }
        }

        this.rhsEditor = acemodule.edit('rhseditor');
        this.rhsEditor.setHighlightActiveLine(false);
        this.rhsEditor.setShowPrintMargin(false);
        this.rhsEditor.setHighlightGutterLine(false);
        this.rhsEditor.setReadOnly(true);
        this.rhsEditor.setFontSize(editorFontSize);
        this.rhsEditor.setValue('// ... loading WASM');
        this.rhsEditor.clearSelection();

        (this.rhsEditor.renderer as any).$cursorLayer.element.style.display = 'none';
    }

    private handleDropdownChange(groupId: string, value: string) {
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

    private urlPrefix(): string {
        if (window.location.host.startsWith('localhost')) {
            return 'http://localhost:8081';
        }
        return '';
    }

    public onUrlHashChange(e: HashChangeEvent) {
        this.setState(this.urlToState(), this.updateOutput.bind(this));
    }

    public urlToState(): AppState {
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

    private inputDidChange(): void {
        if (this.state.saved) {
            window.history.pushState({}, 'CUE Playground', '?id=' + window.location.hash)
            this.setState({ ...this.state, saved: false, showSaveURL: false });
        }
        this.updateOutput();
    }

    private updateOutput(): void {
        if (this.props.WasmAPI.CUECompile === undefined || this.lhsEditor === undefined) {
            return;
        }
        let pre = this.lhsEditor.getValue();
        let post = this.props.WasmAPI.CUECompile(this.state.input.value, this.state.func.value, this.state.output.value, pre);
        let val = post.error;
        if (val === '') {
            val = post.value;
        }
        this.rhsEditor.setValue(val);
        this.rhsEditor.clearSelection();
    }

    private share(): void {
        let contents = this.lhsEditor.getValue();
        let req = fetch(this.urlPrefix() + '/.netlify/functions/snippets', {
            method: 'POST',
            headers: { 'Content-Type': 'text/plain;' },
            body: contents,
        });
        req.then((resp: Response) => {
            return resp.text();
        }).then((data: string) => {
            window.history.pushState({}, 'CUE Playground', '?id=' + data + window.location.hash)
            this.setState({ ...this.state, saved: true, showSaveURL: true });
        }).catch((error) => {
            // TODO improve this
            console.log('Failed to share', error);
        });
    }
}
