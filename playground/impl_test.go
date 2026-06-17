// Copyright 2020 The CUE Authors
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

package main

import (
	"os"
	"testing"

	"github.com/cue-lang/cuelang.org/playground/internal/tdtest"
)

// TestMain wires CUE_UPDATE through to tdtest, so that running
//
//	CUE_UPDATE=1 go test ./...
//
// rewrites the OutVal and Err golden values in testTable below in place.
func TestMain(m *testing.M) {
	tdtest.UpdateTests = os.Getenv("CUE_UPDATE") != ""
	os.Exit(m.Run())
}

type testCase struct {
	In     input
	Fn     function
	Out    output
	InVal  string
	OutVal string
	Err    string
}

var testTable = []testCase{
	{In: inputCUE, Fn: functionDef, Out: outputCUE, InVal: "", OutVal: "\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "", OutVal: "\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "a: b: 5\na: c: 4", OutVal: `a: {
	b: 5
	c: 4
}
`},
	{In: inputCUE, Fn: functionExport, Out: outputJSON, InVal: "test: 5", OutVal: "{\n    \"test\": 5\n}\n"},

	// Incomplete values.
	{In: inputCUE, Fn: functionDef, Out: outputCUE, InVal: "foo: int", OutVal: "foo: int\n"},
	{In: inputCUE, Fn: functionEval, Out: outputCUE, InVal: "foo: int", OutVal: "foo: int\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "foo: int", Err: "foo: incomplete value int"},
	{In: inputCUE, Fn: functionExport, Out: outputJSON, InVal: "foo: int", Err: "foo: incomplete value int"},

	// Required fields only fail in export mode.
	{In: inputCUE, Fn: functionDef, Out: outputCUE, InVal: "foo!: int", OutVal: "foo!: int\n"},
	{In: inputCUE, Fn: functionEval, Out: outputCUE, InVal: "foo!: int", OutVal: "foo!: int\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "foo!: int", Err: "foo: field is required but not present"},

	// Selecting defaults; def does less.
	{In: inputCUE, Fn: functionDef, Out: outputCUE, InVal: "foo: int | *3", OutVal: "foo: int | *3\n"},
	{In: inputCUE, Fn: functionEval, Out: outputCUE, InVal: "foo: int | *3", OutVal: "foo: 3\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "foo: int | *3", OutVal: "foo: 3\n"},
	{In: inputCUE, Fn: functionExport, Out: outputJSON, InVal: "foo: int | *3", OutVal: "{\n    \"foo\": 3\n}\n"},

	// Simplifying values; def does less.
	{In: inputCUE, Fn: functionDef, Out: outputCUE, InVal: "foo: [1, 2, 3][1]", OutVal: "foo: [1, 2, 3][1]\n"},
	{In: inputCUE, Fn: functionEval, Out: outputCUE, InVal: "foo: [1, 2, 3][1]", OutVal: "foo: 2\n"},
	{In: inputCUE, Fn: functionExport, Out: outputCUE, InVal: "foo: [1, 2, 3][1]", OutVal: "foo: 2\n"},
	{In: inputCUE, Fn: functionExport, Out: outputJSON, InVal: "foo: [1, 2, 3][1]", OutVal: "{\n    \"foo\": 2\n}\n"},

	// Pattern constraints with different output formats; see https://cuelang.org/issue/2417
	{
		In: inputCUE, Fn: functionExport, Out: outputCUE,
		InVal: `
			[ID=_]: x: y: ID
			"foo": {}
		`,
		OutVal: "foo: {\n\tx: {\n\t\ty: \"foo\"\n\t}\n}\n",
	},
	{
		In: inputCUE, Fn: functionExport, Out: outputJSON,
		InVal: `
			[ID=_]: x: y: ID
			"foo": {}
		`,
		OutVal: "{\n    \"foo\": {\n        \"x\": {\n            \"y\": \"foo\"\n        }\n    }\n}\n",
	},

	// Cases which one could argue should be errors, beyond just being incomplete.
	{
		In: inputCUE, Fn: functionEval, Out: outputCUE,
		InVal: `
			x: string
			y: (x): string
		`,
		OutVal: "x: string\ny: {\n\t(x): string\n}\n",
	},
	{
		In: inputCUE, Fn: functionEval, Out: outputCUE,
		InVal: `
			x: x2: "foo"
			y: x.missing
		`,
		OutVal: "x: {\n\tx2: \"foo\"\n}\ny: x.missing\n",
	},

	// Simple format checks; no errors
	{
		In: inputCUE, Fn: functionFmt, Out: outputCUE,
		InVal:  "  package foo\n",
		OutVal: "package foo\n",
	},
	{
		In: inputJSON, Fn: functionFmt, Out: outputJSON,

		// Preserve double-declaration; this is format-only, not evaluation
		InVal:  "{\n\"x\":  5,\n\"x\":  5\n}\n",
		OutVal: "{\n  \"x\": 5,\n  \"x\": 5\n}\n",
	},

	// Error format checks
	{
		In: inputCUE, Fn: functionFmt, Out: outputCUE,
		InVal:  "  {\n",
		OutVal: "  {\n",
	},
	{
		In: inputJSON, Fn: functionFmt, Out: outputJSON,
		InVal:  "{\nx:  5\n}\n",
		OutVal: "{\nx:  5\n}\n",
	},
	{
		In: inputYaml, Fn: functionFmt, Out: outputYaml,
		InVal: "x:  5\n",
		Err:   "don't (yet) know how to format \"yaml\"",
	},
}

func TestHandleCUECompile(t *testing.T) {
	tdtest.Run(t, testTable, func(t *tdtest.T, tc *testCase) {
		out, err := handleCUECompile(tc.In, tc.Fn, tc.Out, tc.InVal)
		var gotErr string
		if err != nil {
			gotErr = err.Error()
		}
		t.Equal(out, tc.OutVal)
		t.Equal(gotErr, tc.Err)
	})
}
