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

// index.tsx is the entry point for our application. It:
//
// * declares depenedencies (css, JavaScript, WASM etc)
// * renders the React appliction


import * as React from 'react';
import { createRoot } from 'react-dom/client';

import { App } from './containers/app';
import { WasmAPIImpl } from './wasm_api';
import { environment } from './environment';

// window.WasmAPI is a well-known location to our Go code. It is where
// API methods are registered. When methods are added, the Go code calls
// FireOnChange to allow any interested consumers to handle the newly
// registered method(s).
window.WasmAPI = new WasmAPIImpl();

// Run our application, passing in the WasmAPI object (to avoid application
// code also needing to know about the well-known location)
const root = createRoot(document.getElementById('root') as HTMLElement);
root.render(
    <App WasmAPI={ window.WasmAPI }/>
);
// Now load and run the Go code which will register the Wasm API
const go = new Go();

const wasmPath = environment.wasmPath;
const sourceFile = `${ wasmPath }/main.wasm`;

// WebAssembly.instantiateStreaming() is preferred, but not all browsers support it
if (typeof WebAssembly.instantiateStreaming === 'function') {
    WebAssembly.instantiateStreaming(fetch(sourceFile), go.importObject).then(result => {
        go.run(result.instance);
    });
} else {
    fetch(sourceFile).then(response =>
        response.arrayBuffer()
    ).then(bytes =>
        WebAssembly.instantiate(bytes, go.importObject)
    ).then(result => {
        go.run(result.instance);
    });
}
