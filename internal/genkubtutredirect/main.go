// Copyright 2019 CUE Authors
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

// gentipredirect regenerates a simple Hugo markdown file that acts as a redirect
// to the @master module documentation root on pkg.go.dev
package main

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"

	// imported for side effect of module being available in cache
	_ "cuelang.org/go/pkg"
	"golang.org/x/mod/module"
	"golang.org/x/mod/semver"
)

func main() {
	log.SetFlags(log.Lshortfile)

	var cueVersion bytes.Buffer
	cmd := exec.Command("go", "list", "-m", "-f={{.Version}}", "cuelang.org/go")
	cmd.Stdout = &cueVersion
	if err := cmd.Run(); err != nil {
		log.Fatalf("failed to run %v; %v", strings.Join(cmd.Args, " "), err)
	}
	url := versionToGitHubPath(strings.TrimSpace(cueVersion.String()))

	content := fmt.Sprintf(`---
type: redirect
redirectURL: https://github.com/cue-lang/cue/blob/%v/doc/tutorial/kubernetes/README.md
---`, url)

	const target = "kubernetes.md"
	if err := os.WriteFile(target, []byte(content), 0666); err != nil {
		log.Fatalf("failed to write to %v; %v", target, err)
	}
}

// versionToGitHubPath translates a semver version to a URL path element
// for referencing a GitHub blob. This is necessary principally because
// the version might be a pseudo-version, and GitHub knows nothing about
// such versions.
func versionToGitHubPath(v string) string {
	if !module.IsPseudoVersion(v) {
		return v
	}
	pr := semver.Prerelease(v)
	parts := strings.Split(pr, "-")
	return parts[2]
}
