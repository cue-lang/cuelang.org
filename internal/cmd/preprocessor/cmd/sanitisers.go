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
	init() error
	sanitise(*commandStmt) error
}

type sanitiserMatcher interface {
	sanitiser
	matcher
}

type matcher interface {
	matches(cmd *syntax.Stmt) (bool, error)
}

// kindAndCommand is the structure common to various types that are tied to
// commands or steps. It defines a unique kind, and a series of fields that are
// part of a one-of that identify when a value of the containing type should
// apply.
//
// The kindAndCommand is generally embedded in other types, e.g.
// patternSanitiser.
type kind struct {
	// Kind is a discriminator field for identifying the containing type in
	// config
	Kind string `json:"kind"`
}

type matchSpec struct {
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

func (m *matchSpec) init() error {
	// We rely on the CUE validation here to know this is a one-of.

	cmd := m.Command
	if m.CommandPrefix != "" {
		cmd = m.CommandPrefix
	}
	file, err := syntax.NewParser(syntax.KeepComments(true)).Parse(strings.NewReader(cmd), " ")
	if err != nil {
		return fmt.Errorf("failed to parse %q: %v", cmd, err)
	}
	// We should only have one stmt
	if l := len(file.Stmts); l != 1 {
		return fmt.Errorf("expected 1 statement; found %d", l)
	}
	m.stmt = file.Stmts[0]
	return nil
}

func (m *matchSpec) matches(got *syntax.Stmt) (bool, error) {
	want := m.stmt

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
		if matched, err := matchArgs(m, got.Args, want.Args); err != nil || !matched {
			return matched, err
		}
	case *syntax.DeclClause:
		want, ok := want.Cmd.(*syntax.DeclClause)
		if !ok {
			return false, nil
		}
		if got.Variant.Value != want.Variant.Value {
			return false, nil
		}
		if matched, err := matchArgs(m, got.Args, want.Args); err != nil || !matched {
			return matched, err
		}
	case *syntax.BinaryCmd:
		// Match the X part only
		return m.matches(got.X)
	default:
		return false, fmt.Errorf("don't know how to handle stmt of type %T", got)
	}
	return true, nil
}

func matchArgs[T syntax.Node](m *matchSpec, got, want []T) (bool, error) {
	if m.CommandPrefix != "" {
		// When in command prefix match moding, we need got to be >= want
		if len(got) < len(want) {
			return false, nil
		}
	} else {
		// Else we need to have exactly the same length otherwise it cannot
		// possibly be a match
		if len(got) != len(want) {
			return false, nil
		}
	}
	p := syntax.NewPrinter(syntax.SingleLine(true))
	for i := range want {
		var gotS, wantS strings.Builder
		p.Print(&gotS, got[i])
		p.Print(&wantS, want[i])

		// TODO: per @mvdan, revisit whether we can/should use
		// reflect.DeepEqual or some other mechanism here (with performance
		// being the main consideration).
		if gotS.String() != wantS.String() {
			return false, nil
		}
	}
	return true, nil
}

// patternKindAndCommand defines a common type to be embedded in types that use
// pattern-based matching.
type patternProperties struct {
	// Pattern defines the regexp that defines a match
	Pattern pattern `json:"pattern"`

	// pattern is the regexp encoding of Pattern. Or put another way, the
	// Pattern type represents an encoding of Go's regexp.Regexp type.
	pattern *regexp.Regexp
}

func (p *patternProperties) init() (err error) {
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
	patternProperties

	Replacement string `json:"replacement"`
}

type pattern struct {
	Expr    string `json:"expr"`
	Longest bool   `json:"longest"`
}

func (p *patternSanitiser) sanitise(cmd *commandStmt) error {
	cmd.Output = p.pattern.ReplaceAllString(cmd.Output, p.Replacement)
	return nil
}

type patternSanitiserMatcher struct {
	kind
	patternSanitiser
	matchSpec
}

func (p *patternSanitiserMatcher) init() error {
	if err := p.patternSanitiser.init(); err != nil {
		return err
	}
	if err := p.matchSpec.init(); err != nil {
		return err
	}
	return nil
}

// An ellipsisSanitiser allows output that _might_ be very long to be removed
// and replaced with the canonical '...' which is intended to indicate "and
// there is is more not shown here". The key here is that we add a '...'
// regardless of whether the output exceeds Start and leave it to the caller to
// do what makes most sense. This is because in some situations, for example go
// mod tidy, a command might output lots of text. This can happen, for example,
// when a cache is empty. If the same command is run in a situation where there
// is no output, then there might be no output. In this case we would use an
// ellipsis sanitiser to always print only a '...' so that the output is
// stable.
type ellipsisSanitiser struct {
	Start int `json:"start"`
}

func (e *ellipsisSanitiser) init() error { return nil }

func (e *ellipsisSanitiser) sanitise(cmd *commandStmt) error {
	// TODO this can likely be optimised once we have it working :)

	if cmd.Output == "" {
		cmd.Output = "...\n"
		return nil
	}

	lines := strings.Split(cmd.Output, "\n")

	// "Clip" the lines based on the start or number of lines, whichever is
	// smallest.
	end := min(len(lines), e.Start)
	lines = lines[:end]

	// Drop any empty strings which will appear odd as blank lines just before
	// the ...
	var i int
	for i = end - 1; i >= 0; i-- {
		if lines[i] != "" {
			break
		}
	}
	lines = lines[:i+1]

	// Add the '...' regardless.
	lines = append(lines, "...")

	cmd.Output = strings.Join(lines, "\n") + "\n"
	return nil
}

type ellipsisSanitiserMatcher struct {
	kind
	ellipsisSanitiser
	matchSpec
}

func (e *ellipsisSanitiserMatcher) init() error {
	return e.matchSpec.init()
}
