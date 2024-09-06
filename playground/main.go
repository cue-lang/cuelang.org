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

//go:build js && wasm
// +build js,wasm

//go:generate ./_scripts/revendorToolsInternal.bash

package main

import (
	"fmt"
	"syscall/js"

	"cuelang.org/go/cue/errors"
)

// TODO: for some reason recompiling the main.wasm file does not trigger
// webpack to hot reload. We get "nothing hot updated"

func main() {
	api := js.Global().Get("WasmAPI")
	api.Set("CUECompile", js.FuncOf(cueCompile))
	api.Call("FireOnChange")
	select {}
}

func cueCompile(this js.Value, args []js.Value) interface{} {
	// args[0] is the input type
	// args[1] is the function
	// args[2] is the output type
	// args[3] is the actual input value
	const expArgs = 4
	if len(args) != expArgs {
		panic(fmt.Errorf("cueCompile: expected %v args, got %v", expArgs, len(args)))
	}
	for i := 0; i < expArgs; i++ {
		if t := args[i].Type(); t != js.TypeString {
			panic(fmt.Errorf("cueCompile: expected arg %v to be of type syscall/js.TypeString, got %v", i, t))
		}
	}
	in := input(args[0].String())
	fn := function(args[1].String())
	out := output(args[2].String())
	inVal := args[3].String()

	val, err := handleCUECompile(in, fn, out, inVal)
	return map[string]interface{}{
		"value": val,
		"error": allErrors(err),
	}
}

func allErrors(err error) string {
	if err == nil {
		return ""
	}
	var cueErr errors.Error
	if !errors.As(err, &cueErr) {
		return err.Error()
	}
	return errors.Details(cueErr, nil)
}
