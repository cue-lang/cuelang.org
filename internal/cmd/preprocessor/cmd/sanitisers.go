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
	"regexp"
	"strings"
	"sync"

	"mvdan.cc/sh/v3/syntax"
)

type sanitiser interface {
	sanitise(*commandStmt) error
}

type kindAndCommand struct {
	Kind          string `json:"kind"`
	Command       string `json:"command"`
	CommandPrefix string `json:"commandPrefix"`
	Step          string `json:"step"`
}

type patternSanitiser struct {
	kindAndCommand

	Pattern     pattern `json:"pattern"`
	Replacement string  `json:"replacement"`

	// stmt is a parsed version of Command or CommandPrefix.
	stmt      *syntax.Stmt
	pattern   *regexp.Regexp
	stateLock sync.Mutex
}

type pattern struct {
	Pattern  string `json:"pattern"`
	Longest  bool   `json:"longest"`
	Linewise bool   `json:"linewise"`
}

func (c *patternSanitiser) sanitise(cmd *commandStmt) error {
	// Determine if we have a match for this sanitiser.
	// Do this by comparing the
	c.stateLock.Lock()
	if c.stmt == nil || c.pattern == nil {
		if err := c.parseCommandAndPattern(); err != nil {
			c.stateLock.Unlock()
			return err
		}
	}
	c.stateLock.Unlock()

	got := cmd.stmt
	want := c.stmt

	// Negated state must match
	if got.Negated != want.Negated {
		return nil
	}

	switch got := got.Cmd.(type) {
	case *syntax.CallExpr:
		want, ok := want.Cmd.(*syntax.CallExpr)
		if !ok {
			return nil
		}
		if c.CommandPrefix != "" {
			if len(got.Args) < len(want.Args) {
				return nil
			}
		} else {
			if len(got.Args) != len(want.Args) {
				fmt.Printf(">>>> %v == %v\n", cmd.stmt, c.stmt)
				return nil
			}
		}
		p := syntax.NewPrinter(syntax.SingleLine(true))
		for i, _ := range want.Args {
			var gotS, wantS strings.Builder
			p.Print(&gotS, got.Args[i])
			p.Print(&wantS, want.Args[i])
			if gotS.String() != wantS.String() {
				return nil
			}
		}
	default:
		return fmt.Errorf("don't know how to handle stmt of type %T", got)
	}

	// We matched.

	todo := []string{cmd.Output}
	if c.Pattern.Linewise {
		todo = strings.Split(cmd.Output, "\n")
	}
	for i, t := range todo {
		todo[i] = c.pattern.ReplaceAllString(t, c.Replacement)
	}
	cmd.Output = strings.Join(todo, "\n")

	return nil
}

// parseCommandAndPattern parses c.Command or c.CommandPrefix based on which is
// set, and c.Pattern.
func (c *patternSanitiser) parseCommandAndPattern() error {
	cmd := c.Command
	if c.CommandPrefix != "" {
		cmd = c.CommandPrefix
	}
	file, err := syntax.NewParser(syntax.KeepComments(true)).Parse(strings.NewReader(cmd), " ")
	if err != nil {
		return fmt.Errorf("failed to parse %q: %v", cmd, err)
	}
	// We should only have one stmt
	if l := len(file.Stmts); l != 1 {
		return fmt.Errorf("expected 1 statement; found %d", l)
	}
	c.stmt = file.Stmts[0]

	c.pattern, err = regexp.Compile(c.Pattern.Pattern)
	if err != nil {
		return err
	}
	if c.Pattern.Longest {
		c.pattern.Longest()
	}

	return nil
}
