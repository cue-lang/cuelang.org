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

	"github.com/cue-lang/tmp/internal/ci/base"
	"github.com/cue-lang/cuelang.org/internal/ci/repo"
	"github.com/cue-lang/cuelang.org/internal/ci/github"
	_netlify "github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

fs: base.#writefs & {
	tool: "internal/ci/ci_tool.cue"

	remove: [
		"../../.github/workflows/*\(base.workflowFileExtension)",
	]

	create: {
		let donotedit = base.doNotEditMessage & {#generatedBy: "internal/ci/ci_tool.cue", _}

		// GitHub workflows
		let concreteWorkflows = json.Unmarshal(json.Marshal(github.workflows))
		for _name, _workflow in concreteWorkflows {
			"../../.github/workflows/\(_name)\(base.workflowFileExtension)": contents: _workflow
		}

		// Netlify config
		"../../netlify.toml": contents: _netlify.config

		"../../hugo/layouts/index.redir": {
			let _contents = _netlify.#toRedirects & {#input: _netlify.redirects, _}
			contents: """
			# \(donotedit)

			\(strings.TrimSpace(_contents))

			"""
		}

		"../../hugo/layouts/robots.txt": {
			let _contents = _netlify.#toRobotsTxt & {#input: _netlify.redirects, _}
			contents: """
			# \(donotedit)

			\(strings.TrimSpace(_contents))

			"""
		}

		"../../codereview.cfg": {
			let _contents = base.toCodeReviewCfg & {#input: repo.codeReview, _}
			contents: """
			# \(donotedit)

			\(strings.TrimSpace(_contents))

			"""
		}

		"../../_scripts/env.bash": {
			let _contents = strings.Join([for k, v in repo.env {"export \(k)=\(v)"}], "\n")
			contents: """
			# \(donotedit)

			\(_contents)

			"""
		}
	}
}
