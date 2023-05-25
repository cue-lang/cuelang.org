// Copyright 2023 The CUE Authors
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
	"os/exec"
	"testing"
)

// TestGenerate re-runs go generate in cmd as a convenience.  It is likely the
// preprocessor will change quite regularly.  Running go test is more common
// than go generate. Failing to run go generate will result in CI failures
// because the selfHash variable will be out of date. Making this part of the
// test setup makes this potential footgun a lot less likely. Doing so does not
// appear to break the test cache, which would otherwise have been a good reason
// for now doing this.
func TestGenerate(t *testing.T) {
	out, err := exec.Command("go", "generate").CombinedOutput()
	if err != nil {
		t.Fatalf("failed to re-run go generate: %v\n%s", err, out)
	}
}
