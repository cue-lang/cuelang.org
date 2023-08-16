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

// wasm_exec.d.ts is a type definition that wraps the wasm_exec.js file
// copied from the Go source tree. It also provides the type definitions
// for the API our Go program will export to window.WasmAPI

declare class Go {
	constructor();
	importObject: any;
	run(v: any): void;
}

declare type WasmAPICallback = (v: WasmAPI) => void;

declare interface WasmAPI {
	FireOnChange(): void;

	// TODO: for some reason we do not get a compiler error
	// when passing a function with no parameters as an argument.
	// Work out why this is.
	OnChange(callback: WasmAPICallback): void;
	readonly CUECompile: ((input: string, func: string, output: string, inputVal: string) => CUECompileResponse) | undefined;
	// TODO: Switch to version below when WASM gets updated to multi-workspace version
    // readonly CUECompile: ((config: WasmConfig) => CUECompileResponse) | undefined;
}

declare interface WasmConfig {
    workspace: string;
    inputs: {
        type: string;
        language: string;
        value: string;
    }[];
    function?: string;
    outputLanguage?: string;
}

declare interface CUECompileResponse {
	readonly value: string;
	readonly error: string;
}

// TODO: Switch to version below when WASM gets updated to multi-workspace version
// declare interface CUECompileResponse {
//     readonly success: boolean;
//     readonly output: string;
//     readonly outputType?: string;
// }

declare interface Window {
	WasmAPI: WasmAPI;
}
