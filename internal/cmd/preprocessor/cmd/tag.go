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

const (
	// tagNorun is the tag used in a txtar-based directive like sidebyside or script
	// to indicate that that node should not be run. For an upload directive, it
	// means the commands in the step are not included in the multi-step script that
	// is compiled, but the commands are included in the output. Thus the rendered
	// output is just the commands, but not any output they would otherwise have
	// generated.
	tagNorun = "norun"

	// tagNoFormat is the tag used in a txtar-based directive to indicate that a
	// file in the archive should not be formatted. A tagNoFormat tag requires an
	// argument, the filepath of the file not to format.
	tagNoFmt = "nofmt"

	// tagCodeTab identifies the tag key used to pass options to the code-tab emitted
	// for a file in a txtar-based directive like sidebyside or upload. A tagCodeTab
	// tag requires an argument, the filepath of a file in the files in the archive.
	tagCodeTab = "codetab"

	// tagLocation identifies the location key used to define the location of
	// files in a txtar archive. If specified, the tagLocation requires as many
	// unquoted arguments as there are files. e.g.
	//
	//     #location top-left top-right bottom
	//
	tagLocation = "location"
)
