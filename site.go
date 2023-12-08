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

package site

// Remove the generated cue CLI reference source docs via a glob, before
// siteCUE.bash recreates them. This copes with the situation where a new CUE
// cli has removed an old command. The deletion has to be done here (and not in
// a go:generate step inside content/docs/reference/cli/) because go:generate
// processes a nested package's content after its parent directories.
// TODO: this currently causes a problem in CI, where there's an "early"
// clean-git-state check immediately after go:generate is invoked, but the
// rm-rf has wiped out the docs' committed gen_cache.cue files, anticipating
// their identical recreation by a preprocessor invocation.
// TODO: go:generate bash -c "rm -rf content/docs/reference/cli/cue*"

//go:generate ./_scripts/siteCUE.bash cmd gen
