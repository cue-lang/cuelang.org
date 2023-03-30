// Copyright 2023 CUE Authors
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

package gerritstatusupdater

import (
	"testing"

	"github.com/google/go-cmp/cmp"
)

func TestParseDispatchTrailer(t *testing.T) {
	testCases := []struct {
		key string
		in  string
		out string
	}{
		{
			key: "contains trailer",
			in: `
internal/ci: baseline against main CUE repo post CI changes

Signed-off-by: Paul Jolly <paul@myitcv.io>
Change-Id: I2a5f477367fbb94c7eb3a7657cfbfb642a72a8cb
Dispatch-Trailer: {"type":"trybot","CL":551434,"patchset":30,"targetBranch":"master","ref":"refs/changes/34/551434/30"}
			`,
			out: `{"type":"trybot","CL":551434,"patchset":30,"targetBranch":"master","ref":"refs/changes/34/551434/30"}`,
		},
		{
			key: "no trailers",
			in: `
internal/ci: baseline against main CUE repo post CI changes

			`,
			out: "",
		},
	}

	for _, tc := range testCases {
		t.Run(tc.key, func(t *testing.T) {
			got := parseDispatchTrailer(tc.in)
			want := tc.out
			if got != want {
				t.Error(cmp.Diff(got, want))
			}
		})
	}

}
