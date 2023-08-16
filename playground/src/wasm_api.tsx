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

// WasmAPIImpl is the lightweight container for our Wasm API. The TypeScript
// application will call OnChange to register callbacks that are interested
// in when API methods are added, and then read from CUECompile etc. The Go code
// will set CUECompile and then call FireOnChange.

export class WasmAPIImpl {
	private callbacks = new Array<WasmAPICallback>();
	public readonly CUECompile: ((mode: string, input: string) => CUECompileResponse) | undefined;

	OnChange(f: WasmAPICallback): void {
		if (this.callbacks.indexOf(f) != -1) {
			return;
		}
		this.callbacks.push(f);
	}

	FireOnChange(): void {
		for (let c of this.callbacks) {
			c(this);
		}
	}
}
