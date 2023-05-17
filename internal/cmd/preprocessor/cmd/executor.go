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
	"fmt"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

type executor struct {
	// wd is the working directory
	wd string

	// root is the project root that contains content
	// and hugo/content subdirectories
	root string

	// cmd is the execute Cobra command, used to access flag values etc
	cmd *Command

	// ctx is the context used for all CUE operations
	ctx *cue.Context

	errorContext
}

func (e *executor) Format(f fmt.State, verb rune) {
	fmt.Fprintf(f, "%s", e.root)
}

func newExecutor(ctx executionContext, wd, projectRoot string, cmd *Command) *executor {
	res := &executor{
		wd:   wd,
		root: projectRoot,
		cmd:  cmd,
		ctx:  cuecontext.New(),
		errorContext: errorContext{
			executionContext: ctx,
			log:              os.Stderr,
		},
	}
	return res
}

// execute runs the transformation recursively walking through e.wd. If filter
// is non-nil the it limits the execute step to only those directories present
// in filter.
func (e *executor) execute(filter map[string]bool) error {
	e.debugf("working directory: %v\n", e.wd)

	// Establish a temporary directory within which all other temp
	// material will be gathered. That way we only have to clean up
	// a single temp dir at the end
	td, err := os.MkdirTemp("", "preprocessor-*")
	if err != nil {
		return e.errorf("failed to create temp dir: %v", err)
	}
	e.tempRoot = td
	defer os.RemoveAll(td)

	ec := e.newExecuteContext(filter)
	return ec.execute()
}
