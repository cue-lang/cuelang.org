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
	"context"
	"os"

	"cuelang.org/go/cue/errors"
	"github.com/spf13/cobra"
)

// Main runs the preprocessor tool and returns the code for passing to os.Exit.
//
// We follow the same approach here as the cue command (as well as using the
// using the same version of Cobra) for consistency. Panic is used as a
// strategy for early-return from any running command.
func Main() int {
	cwd, _ := os.Getwd()
	err := mainErr(context.Background(), os.Args[1:])
	if err != nil {
		if err != errPrintedError {
			errors.Print(os.Stderr, err, &errors.Config{
				Cwd: cwd,
			})
		}
		return 1
	}
	return 0
}

func mainErr(ctx context.Context, args []string) (err error) {
	defer recoverError(&err)
	cmd, err := New(args)
	if err != nil {
		return err
	}
	return cmd.Run(ctx)
}

func New(args []string) (cmd *Command, err error) {
	defer recoverError(&err)

	cmd = newRootCmd()
	rootCmd := cmd.root
	if len(args) == 0 {
		return cmd, nil
	}
	rootCmd.SetArgs(args)
	return
}

func newRootCmd() *Command {
	cmd := &cobra.Command{
		Use:          "preprocessor",
		Short:        "preprocessor generates hugo friendly content from an author-friendly format",
		SilenceUsage: true,
	}

	// Hide the completion command
	cmd.CompletionOptions.HiddenDefaultCmd = true

	c := &Command{Command: cmd, root: cmd}

	subCommands := []*cobra.Command{
		newExecuteCmd(c),
	}

	for _, sub := range subCommands {
		cmd.AddCommand(sub)
	}

	return c
}
