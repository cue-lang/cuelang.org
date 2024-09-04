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

package ci

import (
	"encoding/json"
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci/base"
	"github.com/cue-lang/cuelang.org/internal/ci/repo"
	"github.com/cue-lang/cuelang.org/internal/ci/github"
	_netlify "github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// #writefs mirrors the type of the arguments expected by
// internal/cmd/writefs
#writefs: {
	// Tool is the name of the tool that generated the files declared in Create
	Tool!: string

	// Remove is the set of globs of filepaths to remove prior to Create
	Remove?: [...string]

	// Create is the set of files to create.
	Create?: [filepath=string]: {
		Type:     "symlink"
		Contents: string
	} | *{
		Type: "file"

		// In case filepath has an extension known to CUE (and writefs), the
		// concrete CUE value of Contents can be of any type. Otherwise, Contents
		// must be a string.
		Contents: _
	}
}

fs: #writefs & {
	Tool: "internal/ci/ci_tool.cue"

	Remove: [
		"../../.github/workflows/*)\(base.workflowFileExtension)",
	]

	Create: {
		let donotedit = base.doNotEditMessage & {#generatedBy: "internal/ci/ci_tool.cue", _}

		// GitHub workflows
		let concreteWorkflows = json.Unmarshal(json.Marshal(github.workflows))
		for _name, _workflow in concreteWorkflows {
			"../../.github/workflows/\(_name)\(base.workflowFileExtension)": Contents: _workflow
		}

		// Netlify config
		"../../netlify.toml": Contents: _netlify.config

		"../../hugo/layouts/index.redir": {
			let contents = _netlify.#toRedirects & {#input: _netlify.config, _}
			Contents: """
			# \(donotedit)

			\(strings.TrimSpace(contents))

			"""
		}

		"../../codereview.cfg": {
			let contents = base.toCodeReviewCfg & {#input: repo.codeReview, _}
			Contents: """
			# \(donotedit)

			\(strings.TrimSpace(contents))

			"""
		}
	}
}
