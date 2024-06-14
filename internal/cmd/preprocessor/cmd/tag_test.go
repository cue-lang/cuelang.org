// Copyright 2024 The CUE Authors
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

package cmd

import (
	"testing"

	"github.com/go-quicktest/qt"
)

var findTagCases = []struct {
	name    string
	src     string
	key     string
	arg     string
	args    []string
	present bool
	err     string
}{
	{
		name: "bare tag not present",
		src:  "#nofmt\n--main.go--\n",
		key:  "rubbish",
	},
	{
		name:    "bare #nofmt with no args",
		src:     "#nofmt\n--main.go--\n",
		key:     "nofmt",
		present: true,
	},
	{
		name:    "bare #nofmt with args",
		src:     "#nofmt hello world\n--main.go--\n",
		key:     "nofmt",
		args:    []string{"hello", "world"},
		present: true,
	},
	{
		name: "#nofmt(main.go) with no args does not match with no arg",
		src:  "#nofmt(main.go)\n--main.go--\n",
		key:  "nofmt",
	},
	{
		name:    "#nofmt(main.go) with no args matches with arg",
		src:     "#nofmt(main.go)\n--main.go--\n",
		key:     "nofmt",
		arg:     "main.go",
		present: true,
	},
	{
		name: "#nofmt(main.go) with args does not match with no arg",
		src:  "#nofmt(main.go) hello world\n--main.go--\n",
		key:  "nofmt",
	},
	{
		name:    "#nofmt(main.go) with args matches with arg",
		src:     "#nofmt(main.go) hello world\n--main.go--\n",
		key:     "nofmt",
		args:    []string{"hello", "world"},
		arg:     "main.go",
		present: true,
	},
}

func TestFindTag(t *testing.T) {
	for _, tc := range findTagCases {
		t.Run(tc.name, func(t *testing.T) {

			args, present, err := findTag([]byte(tc.src), tc.key, tc.arg)
			if err != nil {
				if tc.err == "" {
					t.Fatalf("got an error when not expected: %v", err)
				}
				qt.Assert(t, qt.ErrorMatches(err, tc.err))
			} else {
				if tc.err != "" {
					t.Fatalf("did not get an error when we expected %q", tc.err)
				}
				qt.Assert(t, qt.DeepEquals(args, tc.args))
				qt.Assert(t, qt.Equals(present, tc.present))
			}
		})
	}
}
