// Copyright 2024 The CUE Authors
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

	"mvdan.cc/sh/v3/syntax"
)

// A sanitiser sanitises the output from a shell script command. The sanitised
// output removes or replaces things like platform- or OS-specific output. This
// means that contributors produce the same output regardless of platform, OS
// or other systems specifics.
type sanitiser interface {
	sanitise(*commandStmt) error
}

// kindAndCommand is the structure common to various types that are tied to
// commands or steps. It defines a unique kind, and a series of fields that are
// part of a one-of that identify when a value of the containing type should
// apply.
//
// The kindAndCommand is generally embedded in other types, e.g.
// patternSanitiser.
type kindAndCommand struct {
	// Kind is a discriminator field for identifying the containing type in
	// config
	Kind string `json:"kind"`

	// Command, CommandPrefix and Step are a one-of. They define the coniditions
	// under which values of the containing type should apply. We refer to such
	// values as X below.

	// Command defines that X should apply when the entire command is equal to
	// the value set.
	Command string `json:"command"`

	// CommandPrefix defines that X should apply when the command has a prefix
	// equal to the value set.
	CommandPrefix string `json:"commandPrefix"`

	// stmt is a parsed version of Command or CommandPrefix.
	stmt *syntax.Stmt
}

func (k *kindAndCommand) init() error {
	cmd := k.Command
	if k.CommandPrefix != "" {
		cmd = k.CommandPrefix
	}
	file, err := syntax.NewParser(syntax.KeepComments(true)).Parse(strings.NewReader(cmd), " ")
	if err != nil {
		return fmt.Errorf("failed to parse %q: %v", cmd, err)
	}
	// We should only have one stmt
	if l := len(file.Stmts); l != 1 {
		return fmt.Errorf("expected 1 statement; found %d", l)
	}
	k.stmt = file.Stmts[0]
	return nil
}

func (k *kindAndCommand) matches(cmd *commandStmt) (bool, error) {
	got := cmd.stmt
	want := k.stmt

	// Negated state must match
	if got.Negated != want.Negated {
		return false, nil
	}

	switch got := got.Cmd.(type) {
	case *syntax.CallExpr:
		want, ok := want.Cmd.(*syntax.CallExpr)
		if !ok {
			return false, nil
		}
		if k.CommandPrefix != "" {
			if len(got.Args) < len(want.Args) {
				return false, nil
			}
		} else {
			if len(got.Args) != len(want.Args) {
				return false, nil
			}
		}
		p := syntax.NewPrinter(syntax.SingleLine(true))
		for i := range want.Args {
			var gotS, wantS strings.Builder
			p.Print(&gotS, got.Args[i])
			p.Print(&wantS, want.Args[i])

			// TODO: per @mvdan, revisit whether we can/should use
			// reflect.DeepEqual or some other mechanism here (with performance
			// being the main consideration).
			if gotS.String() != wantS.String() {
				return false, nil
			}
		}
	default:
		return false, fmt.Errorf("don't know how to handle stmt of type %T", got)
	}
	return true, nil
}

// patternKindAndCommand defines a common type to be embedded in types that use
// pattern-based matching.
type patternKindAndCommand struct {
	kindAndCommand

	// Pattern defines the regexp that defines a match
	Pattern pattern `json:"pattern"`

	// pattern is the regexp encoding of Pattern. Or put another way, the
	// Pattern type represents an encoding of Go's regexp.Regexp type.
	pattern *regexp.Regexp
}

func (p *patternKindAndCommand) init() (err error) {
	if err := p.kindAndCommand.init(); err != nil {
		return err
	}
	p.pattern, err = regexp.Compile(p.Pattern.Expr)
	if err != nil {
		return err
	}
	if p.Pattern.Longest {
		p.pattern.Longest()
	}
	return nil
}

// A patternSanitiser replaces command output that matches
// a regular expression pattern some some replacement text.
type patternSanitiser struct {
	patternKindAndCommand

	Replacement string `json:"replacement"`
}

type pattern struct {
	Expr    string `json:"expr"`
	Longest bool   `json:"longest"`
}

func (p *patternSanitiser) sanitise(cmd *commandStmt) error {
	if matched, err := p.matches(cmd); err != nil || !matched {
		return err
	}
	cmd.Output = p.pattern.ReplaceAllString(cmd.Output, p.Replacement)
	return nil
}
