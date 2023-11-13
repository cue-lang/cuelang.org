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
	"regexp"
	"testing"
)

func TestRegexpReplaceRand(t *testing.T) {
	rand := "RAND"
	testSimple := "-axxb-ab-"

	cases := []struct {
		name string
		r    string
		t    string
		want string
	}{
		{
			name: "no submatches",
			r:    `ax*b`,
			t:    testSimple,
			want: "-RAND-RAND-",
		},
		{
			name: "single submatch",
			r:    `a(x*)b`,
			t:    testSimple,
			want: "-aRANDb-aRANDb-",
		},
		{
			name: "nested same-width submatch",
			r:    `a((x*))b`,
			t:    testSimple,
			want: "-aRANDb-aRANDb-",
		},
		{
			name: "go test output",
			r:    `^ok .*\t(\d(\.\d+)?)s`,
			t:    "ok  \texample\t0.005s",
			want: "ok  \texample\tRANDs",
		},
	}

	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			r := regexp.MustCompile(c.r)
			got := regexpReplaceRand(c.t, r, rand)
			if c.want != got {
				t.Errorf("got %q, want %q", got, c.want)
			}
		})
	}
}
