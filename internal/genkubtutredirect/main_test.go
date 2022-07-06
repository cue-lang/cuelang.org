// Copyright 2022 CUE Authors
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

import "testing"

func TestVersionToGithubURL(t *testing.T) {
	tcs := []struct {
		in  string
		out string
	}{
		{in: "v0.4.0", out: "v0.4.0"},
		{in: "v0.4.0-rc.1", out: "v0.4.0-rc.1"},
		{in: "v0.0.0-20201118171849-f6a6b3f636fc", out: "f6a6b3f636fc"},
	}
	for _, tc := range tcs {
		got := versionToGitHubPath(tc.in)
		if got != tc.out {
			t.Fatalf("versionToGitHubPath(%q); got %q; want %v", tc.in, got, tc.out)
		}
	}
}
