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

func TestExtractCommand(t *testing.T) {
	type testCase struct {
		name string
		in   string
		want string
	}
	testCases := []testCase{
		{
			name: "empty script",
			in:   "",
			want: "",
		},
		{
			name: "single line script",
			in:   "exec hello world\ncmp hello hello.golden",
			want: "hello world",
		},
		{
			name: "first line comment",
			in:   "#hello\nexec hello world\ncmp hello hello.golden",
			want: "hello world",
		},
	}
	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			got := extractCommand([]byte(tc.in))
			qt.Assert(t, qt.Equals(got, tc.want))
		})
	}
}
