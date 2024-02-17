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

func TestEllipsisSanitiser(t *testing.T) {
	cases := []struct {
		name  string
		input string
		start int
		want  string
	}{
		{
			name:  "empty",
			input: "",
			want:  "...\n",
		},
		{
			name:  "missing trailing newline",
			input: "output",
			start: 1,
			want:  "output\n...\n",
		},
		{
			name:  "empty but non-zero start",
			input: "",
			start: 10,
			want:  "...\n",
		},
		{
			name:  "ensure no blank lines before ...",
			input: "test\n\nsomething",
			start: 2,
			want:  "test\n...\n",
		},
	}

	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			cmd := commandStmt{
				Output: c.input,
			}
			san := ellipsisSanitiser{
				Start: c.start,
			}
			err := san.sanitise(&cmd)
			qt.Assert(t, qt.IsNil(err))
			qt.Assert(t, qt.Equals(cmd.Output, c.want))
		})
	}

}
