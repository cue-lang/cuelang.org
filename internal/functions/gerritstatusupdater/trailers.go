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
	"strings"
)

// parseDispatchTrailer attempts to parse a trailer value for the
// key Dispatch-Trailer from commitMsg. This is a very crude
// approximation of the real git logic. If the trailer is found
// the value for that trailer will be returned. Otherwise an empty
// string is returned.
func parseDispatchTrailer(commitMsg string) string {
	// First search for a Dispatch-Trailer trailer. If we find one
	// use that instead of inspecting the branch.

	// Following the logic of git interpret-trailers --help. We crudely search for
	// a Dispatch-Trailer.

	// Drop any trailing newlines to not confuse the search for the trailers section
	commitMsg = strings.TrimRight(commitMsg, "\n")

	// Trailers are the last block after a clear line. They are line-separated
	// unless a trailer continues on the next line, which is achieved by adding
	// as space at the start of the continuation line.
	parts := strings.Split(commitMsg, "\n\n")

	if len(parts) == 1 {
		// We didn't find a trailer section using our crude approximation
		return ""
	}

	trailers := strings.Split(parts[len(parts)-1], "\n")

	// Search in reverse order to find the effective Dispatch-Trailer if there
	// are multiple of them. For our crude search we ignore continuation lines
	// because we know that a Dispatch-Trailer will be on a single line.
	for i := len(trailers) - 1; i >= 0; i-- {
		t := trailers[i]
		if strings.HasPrefix(t, dispatchTrailer+": {\"type\":\"") {
			lineParts := strings.SplitN(t, " ", 2)
			return lineParts[1]
		}
	}

	return ""
}

// NOTE: keep this consistent with the CUE value
// cuelang.org/go/internal/ci/base.dispatchTrailer
const dispatchTrailer = "Dispatch-Trailer"

// NOTE: keep consistent with CUE schema
// cuelang.org/go/internal/ci/base.#dispatch
type dispatch struct {
	Type         string `json:"type"`
	CL           int    `json:"CL"`
	Patchset     int    `json:"patchset"`
	TargetBranch string `json:"targetBranch"`
	Ref          string `json:"ref"`
}
