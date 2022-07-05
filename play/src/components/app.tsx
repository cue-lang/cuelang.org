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

import * as React from "react";
import * as acemodule from "ace-builds";
import { CUEVersion } from "./gen_cuelang_org_go_version";

const editorFontSize = "11pt";

interface AppProps {
	WasmAPI : WasmAPI;
}

interface AppState {
	readonly Input : InputOption;
	readonly Func : FuncOption;
	readonly Output : OutputOption;
	readonly Saved : boolean;
	readonly ShowSaveURL : boolean;
}

const optionSeparator = "@";

abstract class Option {
	constructor(readonly name : string, readonly key : string) { }
	abstract Hash(state : AppState) : string;
}

function HashOptions(...opts : Option[]) : string {
	let vals : string[] = [];
	for (let o of opts) {
		vals.push(o.key);
	}
	return "#" + vals.join(optionSeparator);
}

class InputOption extends Option {
	Hash(state : AppState) : string {
		return HashOptions(this, state.Func, state.Output);
	}
}

class FuncOption extends Option {
	Hash(state : AppState) : string {
		return HashOptions(state.Input, this, state.Output);
	}
}

class OutputOption extends Option {
	Hash(state : AppState) : string {
		return HashOptions(state.Input, state.Func, this);
	}
}

let inputOptions : InputOption[] = [
	new InputOption("CUE", "cue"),
	// new InputOption("JSON", "json"),
	// new InputOption("Yaml", "yaml"),
];

let funcOptions : FuncOption[] = [
	new FuncOption("export", "export"),
	new FuncOption("def", "def"),
];

let outputOptions : OutputOption[] = [
	new OutputOption("CUE", "cue"),
	new OutputOption("JSON", "json"),
	new OutputOption("Yaml", "yaml"),
]

// App is the root of our React application
export class App extends React.PureComponent<AppProps, AppState> {
	private lhsEditor : acemodule.Ace.Editor;
	private rhsEditor : acemodule.Ace.Editor;

	constructor(props : AppProps) {
		super(props);
		this.state = {
			Input: undefined,
			Func: undefined,
			Output: undefined,
			Saved: false,
			ShowSaveURL: false,
		};
		this.state = this.urlHashToState();

		// TODO is this really required in 2020?
		this.urlHashChanged = this.urlHashChanged.bind(this);
		this.urlHashToState = this.urlHashToState.bind(this);
		this.inputDidChange = this.inputDidChange.bind(this);
		this.updateOutput = this.updateOutput.bind(this);
		this.share = this.share.bind(this);

		props.WasmAPI.OnChange(this.updateOutput);
		window.addEventListener("hashchange", this.urlHashChanged);
	}

	render() {
		// Inputs can be whatever. Funcs are a function of input. Outputs are a function of funcs
		// This logic belongs elsewhere :)
		let inputs = inputOptions;
		let funcs = new Array<FuncOption>();
		funcs.push(funcOptions[0]);
		if (this.state.Input.key == "cue") {
			funcs.push(funcOptions[1]);
		}
		let outputs = outputOptions;
		let showOutputs = "inline-block";
		if (this.state.Func.key == "def") {
			showOutputs = "none";
		}

		return (
			<div className="grid-container">
				<div className="header">
					<div className="title">CUE Playground</div>
					<div className="controls">
						<div className="dropdown" style={{ display: "inline-block" }}>
							<button className="btn btn-secondary btn-sm dropdown-toggle" type="button" id="inputMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Input: {this.state.Input.name}
							</button>
							<div className="dropdown-menu dropdown-menu-right" aria-labelledby="inputMenuButton">
								{[
									inputs.map((v) => <a key={v.key} className="dropdown-item" href={v.Hash(this.state)}>{v.name}</a>)
								]}
							</div>
						</div>
						<div className="dropdown" style={{ display: "inline-block" }}>
							<button className="btn btn-secondary btn-sm dropdown-toggle" type="button" id="funcMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								{this.state.Func.name}
							</button>
							<div className="dropdown-menu dropdown-menu-right" aria-labelledby="funcMenuButton">
								{[
									funcs.map((v) => <a key={v.key} className="dropdown-item" href={v.Hash(this.state)}>{v.name}</a>)
								]}
							</div>
						</div>
						<div className="dropdown" style={{ display: showOutputs }}>
							<button className="btn btn-secondary btn-sm dropdown-toggle" type="button" id="outputMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Output: {this.state.Output.name}
							</button>
							<div className="dropdown-menu dropdown-menu-right" aria-labelledby="outputMenuButton">
								{[
									outputs.map((v) => <a key={v.key} className="dropdown-item" href={v.Hash(this.state)}>{v.name}</a>)
								]}
							</div>
						</div>
						<div>
							<button className="btn btn-secondary btn-sm" type="button" onClick={this.share} disabled={this.state.Saved}>
								Share
							</button>
						</div>
						<div>
							<input style={{ display: (this.state.ShowSaveURL ? "" : "none") }} readOnly={true} className="form-control form-control-sm" id="shareURL" value={window.location.toString()} />
						</div>
					</div>
					<div className="gap">{CUEVersion}</div>
				</div>
				<div className="left">
					<div style={{ width: "100%", height: "100%" }} id="lhseditor"></div>
				</div>
				<div className="right">
					<div style={{ width: "100%", height: "100%" }} id="rhseditor"></div>
				</div>
			</div>
		);
	}

	componentDidMount() : void {
		let l = acemodule.edit("lhseditor");
		this.lhsEditor = l;
		l.setHighlightActiveLine(false);
		l.setShowPrintMargin(false);
		l.on("change", (e : acemodule.Ace.Delta) => {
			this.inputDidChange();
		});
		l.setFontSize(editorFontSize);
		l.focus();

		let urlParams = new URLSearchParams(window.location.search);
		let id = urlParams.get("id");
		if (id != null && id != "") {
			l.setReadOnly(true);
			let app = this;
			let req = fetch(this.urlPrefix() + "/.netlify/functions/snippets?id=" + id, { headers: { "Content-Type": "text/plain;" } });
			req.then((resp : Response) => {
				return resp.text()
			}
			).then((data : string) => {
				app.lhsEditor.setValue(data);
				app.lhsEditor.clearSelection();
				app.lhsEditor.setReadOnly(false);
				app.setState({ ...this.state, Saved: true });
			}).catch((error) => {
				// TODO improve this
				console.log("Error loading snippet with id=" + id, error);
			});
		}

		let r = acemodule.edit("rhseditor");
		this.rhsEditor = r;
		r.setHighlightActiveLine(false);
		r.setShowPrintMargin(false);
		r.setHighlightGutterLine(false);
		r.setReadOnly(true);
		r.setFontSize(editorFontSize);
		r.setValue("// ... loading WASM");
		this.rhsEditor.clearSelection();

		// TODO this feels a bit gross; better way to hide the cursor?
		(r.renderer as any).$cursorLayer.element.style.opacity = 0;
	}

	private urlPrefix() : string {
		if (window.location.host.startsWith("localhost")) {
			return "http://localhost:8081";
		}
		return "";
	}
	private urlHashChanged(ev : HashChangeEvent) {
		this.setState(this.urlHashToState());
		this.updateOutput();
	}

	private urlHashToState() : AppState {
		let hash = window.location.hash;
		if (hash.startsWith("#")) {
			hash = hash.slice(1);
		}
		let h = hash.split("@");
		let inputStr = "";
		let funcStr = "";
		let outputStr = "";
		if (h.length === 3) {
			inputStr = h[0].trim();
			funcStr = h[1].trim();
			outputStr = h[2].trim();
		}
		let input = inputOptions[0];
		let func = funcOptions[0];
		let output = outputOptions[0];
		for (let o of inputOptions) {
			if (inputStr === o.key) {
				input = o;
			}
		}
		for (let o of funcOptions) {
			if (funcStr === o.key) {
				func = o;
			}
		}
		for (let o of outputOptions) {
			if (outputStr === o.key) {
				output = o;
			}
		}
		// TODO: move this validation logic elsewhere
		if (func.key == "def") {
			if (input.key != "cue") {
				func = funcOptions[0];
			}
			if (output.key != "cue") {
				output = outputOptions[0];
			}
		}
		if (input.key !== inputStr || func.key !== funcStr || output.key !== outputStr) {
			window.location.hash = HashOptions(input, func, output);
		}
		return { ...this.state, Input: input, Func: func, Output: output };
	}

	private inputDidChange() : void {
		if (this.state.Saved) {
			window.history.pushState({}, "CUE Playground", "?id=" + window.location.hash)
			this.setState({ ...this.state, Saved: false, ShowSaveURL: false });
		}
		this.updateOutput();
	}

	private updateOutput() : void {
		if (this.props.WasmAPI.CUECompile === undefined || this.lhsEditor === undefined) {
			return;
		}
		let pre = this.lhsEditor.getValue();
		let post = this.props.WasmAPI.CUECompile(this.state.Input.key, this.state.Func.key, this.state.Output.key, pre);
		let val = post.error;
		if (val === "") {
			val = post.value;
		}
		this.rhsEditor.setValue(val);
		this.rhsEditor.clearSelection();
	}

	private share() : void {
		let contents = this.lhsEditor.getValue();
		let req = fetch(this.urlPrefix() + "/.netlify/functions/snippets", {
			method: "POST",
			headers: { "Content-Type": "text/plain;" },
			body: contents,
		});
		req.then((resp : Response) => {
			return resp.text();
		}).then((data : string) => {
			window.history.pushState({}, "CUE Playground", "?id=" + data + window.location.hash)
			this.setState({ ...this.state, Saved: true, ShowSaveURL: true });
		}).catch((error) => {
			// TODO improve this
			console.log("Failed to share", error);
		});
	}
}
