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

//go:generate rm gen_pkghash.go
//go:generate go run github.com/cue-lang/cuelang.org/internal/cmd/genpkghash gen_pkghash.go

import (
	"context"
	"fmt"
	"os"
	"path/filepath"
	"strings"

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
		newImportCmd(c),
	}

	for _, sub := range subCommands {
		cmd.AddCommand(sub)
	}

	return c
}

// deriveProjectRoot finds the project root from the possibly empty working
// directory wd.  If wd is empty, it is assumed to mean ".". An error is
// returned if wd proves to not exist within a project root.
func deriveProjectRoot(dir string) (wd string, projectRoot string, err error) {
	wd = dir
	if wd == "" {
		wd = "."
	}
	wd, err = filepath.Abs(wd)
	if err != nil {
		return "", "", fmt.Errorf("deriveProjectRoot: failed to make %s absolute: %w", wd, err)
	}

	// Ensure that wd is a subdirectory of a directory structure where an
	// ancestor of wd (which could be wd itself) contains content and hugo
	// directories. If wd is itself the directory that contains content and
	// hugo/content, then we interpret that as meaning to run as if content had
	// been specified as the input. Otherwise, wd must be a subdirectory of
	// content/.

	toFind := []string{"content", "hugo"}
	possibleRoot := wd
	for {
		var found int
		for _, dn := range toFind {
			target := filepath.Join(possibleRoot, dn)
			fi, err := os.Stat(target)
			if err == nil && fi.IsDir() {
				found++
			}
		}

		if found == len(toFind) {
			// We found the content root.
			break
		}

		// Move to try the parent if we are not at the root
		parentDir := filepath.Dir(possibleRoot)
		if parentDir == possibleRoot {
			// We are at the root of the filesystem
			return "", "", fmt.Errorf("deriveProjectRoot: failed to find project root before filesystem root")
		}
		possibleRoot = parentDir
	}
	projectRoot = possibleRoot

	if projectRoot == wd {
		// Special case. We want to walk the content dir from its root
		// At this point we know this directory exists.
		wd = filepath.Join(wd, "content")
	} else {
		// Ensure wd is a subdirectory of $projectRoot/content
		cd := filepath.Join(projectRoot, "content")
		if wd != cd && !strings.HasPrefix(wd, cd+string(os.PathSeparator)) {
			return "", "", fmt.Errorf("deriveProjectRoot: working directory %s is not a subdirectory of %s", wd, cd)
		}
	}

	return wd, projectRoot, nil
}
