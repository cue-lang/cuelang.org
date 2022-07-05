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
//

// require-ing main.wasm ensures it is copied to the dist target
require("../main.wasm");
require("./index.css");

// require the wasm_exec.js file as-is.
//
// TODO: it should be possible to have a rule for this in webpack.config.js
// but I couldn't work it out
require("!file-loader?name=[name].[ext]!./wasm_exec.js");

// import-ing bootstrap ensures webpack will load the JS and css
import "bootstrap";
import "bootstrap/dist/css/bootstrap.css";

import * as React from "react";
import * as ReactDOM from "react-dom";

import { App } from "./components/app";
import { WasmAPIImpl } from "./wasm_api";

// window.WasmAPI is a well-known location to our Go code. It is where
// API methods are registered. When methods are added, the Go code calls
// FireOnChange to allow any interested consumers to handle the newly
// registered method(s).
window.WasmAPI = new WasmAPIImpl();

// Run our application, passing in the WasmAPI object (to avoid application
// code also needing to know about the well-known location)
ReactDOM.render(<App WasmAPI={window.WasmAPI} />, document.getElementById("root"));

// Now load and run the Go code which will register the Wasm API
const go = new Go();

const sourceFile = "main.wasm";

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
