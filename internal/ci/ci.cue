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
	"encoding/yaml"
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci/base"
	"github.com/cue-lang/cuelang.org/internal/ci/repo"
	"github.com/cue-lang/cuelang.org/internal/ci/github"
	_netlify "github.com/cue-lang/cuelang.org/internal/ci/netlify"
)

// #writefs mirrors the type of the arguments expected by
// internal/cmd/writefs
#writefs: {
	Remove: [...string]
	Create: [string]: {
		Type:     "symlink" | *"file"
		Contents: *"" | string
	}
}

fs: #writefs & {
	Remove: [
		"../../.github/workflows/*.yml",
	]

	Create: {
		[_]: {
			// TODO: do not hardcode this to ci_tool
			let donotedit = base.doNotEditMessage & {#generatedBy: "internal/ci/ci_tool.cue", _}
			_res:     string
			Contents: "# \(donotedit)\n\n\(strings.TrimSpace(_res))\n"
		}
		for _name, _workflow in github.workflows {
			"../../.github/workflows/\(_name).yml": {
				_res: yaml.Marshal(_workflow)
			}
		}
		"../../codereview.cfg": {
			_res: base.toCodeReviewCfg & {#input: repo.codeReview, _}
		}
		"../../netlify.toml": {
			_res: _netlify.#toToml & {#input: _netlify.config, _}
		}
	}
}
