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

// Remove the generated cue CLI reference source docs, before the next go
// generate step recreates them. The deletion has to be done here because go
// generates nested package content after higher level content, and the
// *generation* of the content is done in the site-wide cue cmd step, below.
//go:generate bash -c "rm -rf content/docs/reference/cli/cue*"
//go:generate ./_scripts/siteCUE.bash cmd gen
