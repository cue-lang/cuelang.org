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
	"log"
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

	// log is the logger used by the executor
	logger *log.Logger

	// ctx is the context used for all CUE operations
	ctx *cue.Context
}

func newExecutor(wd, projectRoot string, cmd *Command) *executor {
	l := log.New(os.Stderr, "", 0)
	return &executor{
		wd:     wd,
		root:   projectRoot,
		cmd:    cmd,
		logger: l,
		ctx:    cuecontext.New(),
	}
}

// execute runs the transformation recursively walking through e.wd. If filter
// is non-nil the it limits the execute step to only those directories present
// in filter.
func (e *executor) execute(filter map[string]bool) error {
	e.debugf("working directory: %v\n", e.wd)

	ec := e.newExecuteContext(filter)
	return ec.execute()
}

// debugf logs debugging information if the --debug flag has been set
func (e *executor) debugf(format string, args ...any) {
	if flagDebug.Bool(e.cmd) {
		e.logger.Printf("debug: "+format, args...)
	}
}
