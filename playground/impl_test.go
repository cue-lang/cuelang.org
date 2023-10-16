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
	"fmt"
	"testing"
)

var testTable = []struct {
	In     input
	Fn     function
	Out    output
	InVal  string
	OutVal string
	Err    string
}{
	{inputCUE, functionExport, outputCUE, "", "\n", ""},
	{inputCUE, functionExport, outputCUE, "a: b: 5\na: c: 4", "a: {\n\tb: 5\n\tc: 4\n}\n", ""},
	{inputCUE, functionExport, outputJSON, "test: 5", "{\n    \"test\": 5\n}\n", ""},

	{
		inputCUE, functionExport, outputCUE,
		`
			[ID=_]: x: y: ID
			"foo": {}
		`,
		"foo: {\n\tx: {\n\t\ty: \"foo\"\n\t}\n}\n",
		"",
	},
	{
		inputCUE, functionExport, outputJSON,
		`
			[ID=_]: x: y: ID
			"foo": {}
		`,
		"{\n    \"foo\": {\n        \"x\": {\n            \"y\": \"foo\"\n        }\n    }\n}\n",
		"",
	},
}

func TestHandleCUECompile(t *testing.T) {
	for _, tv := range testTable {
		t.Run("", func(t *testing.T) {
			desc := fmt.Sprintf("handleCUECompile(%q, %q, %q, %q)", tv.In, tv.Fn, tv.Out, tv.InVal)
			out, err := handleCUECompile(tv.In, tv.Fn, tv.Out, tv.InVal)
			if tv.Err != "" {
				if err != nil {
					if err.Error() != tv.Err {
						t.Fatalf("%v: expected error string %q; got %q", desc, tv.Err, err)
					}
				} else {
					t.Fatalf("%v: expected error, did not see one. Output was %q", desc, out)
				}
			} else {
				if err != nil {
					t.Fatalf("%v: got unexpected error: %v", desc, err)
				} else if out != tv.OutVal {
					t.Fatalf("%v: expected output %q: got %q", desc, tv.OutVal, out)
				}
			}
		})
	}
}
