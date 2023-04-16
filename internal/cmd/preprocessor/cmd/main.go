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
	if !filepath.IsAbs(wd) {
		d, err := filepath.Abs(wd)
		if err != nil {
			return "", "", fmt.Errorf("failed to make %s absolute: %w", wd, err)
		}
		wd = d
	}

	// Ensure that wd is a subdirectory of a directory structure where
	// an ancestor of wd (which could be wd itself) contains content and
	// hugo/content directories. If wd is itself the directory that contains
	// content and hugo/content, then we interpret that is meaning to
	// run as if content had been specified as the input. Otherwise, wd
	// must be a subdirectory of content/.
	projectRoot = wd
	for {
		for _, dn := range []string{"content", "hugo"} {
			fi, err := os.Stat(filepath.Join(projectRoot, filepath.FromSlash(dn)))
			if err != nil || !fi.IsDir() {
				goto WalkParent
			}
		}

		// We found the content root.
		break

	WalkParent:
		pd := filepath.Clean(filepath.Join(projectRoot, ".."))
		if pd == projectRoot {
			// We are at the root of the filesystem
			// and failed to find the content and hugo/content dirs
			return "", "", fmt.Errorf("failed to find project root")
		}
		projectRoot = pd
	}

	if projectRoot == wd {
		// Special case. We want to walk the content dir from its root
		// At this point we know this directory exists.
		wd = filepath.Join(wd, "content")
	} else {
		// Ensure wd is a subdirectory of d/content
		cd := filepath.Join(projectRoot, "content")
		rel, err := filepath.Rel(cd, wd)
		if err != nil {
			return "", "", fmt.Errorf("failed to determine if working directory %s is a subdirectory of the project root %s: %w", wd, projectRoot, err)
		}
		fmt.Println(rel)
		if strings.HasPrefix(rel, "..") {
			return "", "", fmt.Errorf("working directory %s is not a subdirectory of %s", wd, cd)
		}
	}

	return wd, projectRoot, nil
}
