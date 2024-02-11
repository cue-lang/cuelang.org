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
	"regexp"
	"sort"
	"strings"
)

// A comparator normalizes a cmd's output to transformedOutput, replacing parts
// of output that are known to vary in particular ways with rand, a predefined
// pseudo-random value under the control of the caller. This allows for two
// such command outputs that differ only in known ways to be compared as
// bytes-equal after normalization.
type comparator interface {
	init() error
	normalize(cmd *commandStmt, output string, rand string) (transformedOutput string, err error)
}

type comparatorMatcher interface {
	comparator
	matcher
}

// A patternSanitiser replaces command output that matches
// a regular expression pattern some some replacement text.
type patternComparator struct {
	patternProperties
}

func (p *patternComparator) normalize(cmd *commandStmt, output string, rand string) (string, error) {
	return regexpReplaceRand(output, p.pattern, rand), nil
}

type patternComparatorMatcher struct {
	kind
	patternComparator
	matchSpec
}

func (p *patternComparatorMatcher) init() error {
	if err := p.patternComparator.init(); err != nil {
		return err
	}
	if err := p.matchSpec.init(); err != nil {
		return err
	}
	return nil
}

func regexpReplaceRand(input string, re *regexp.Regexp, rand string) string {
	matches := re.FindAllStringSubmatchIndex(input, -1)

	if len(matches) == 0 {
		// No match implies not substitutions required
		return input
	}

	var b strings.Builder
	var i int

	put := func(j int) {
		b.WriteString(input[i:j])
		i = j
	}

	// Some substitutions required
	var start, end int
	var subMatches []int
	for _, match := range matches {
		// TODO: handle the case of nested submatches - by not handling them. We only
		// handle single-level submatches.

		// The first two elements of the match will be the bounds of the pattern match.
		start, end, subMatches = match[0], match[1], match[2:]
		put(start)
		if len(subMatches) == 0 {
			// The pattern does not specify any submatches. Hence we replace the entire
			// match by just writing rand
			b.WriteString(rand)
		} else {
			var subStart, subEnd, subLastEnd int
			for len(subMatches) > 0 {
				subStart, subEnd, subMatches = subMatches[0], subMatches[1], subMatches[2:]
				if subEnd <= subLastEnd {
					// Skip the sub-submatch - we know they are not overlapping
					continue
				}
				put(subStart)
				b.WriteString(rand)
				i = subEnd // skip the submatch - we wrote rand
				subLastEnd = subEnd
			}
			b.WriteString(input[i:end])
		}
		i = end
	}
	b.WriteString(input[end:])
	return b.String()
}

// An unstableLineOrderComparator lexigraphically sorts the lines
// a regular expression pattern some some replacement text.
type unstableLineOrderComparator struct {
}

func (u *unstableLineOrderComparator) normalize(cmd *commandStmt, output string, rand string) (string, error) {
	lines := strings.Split(output, "\n")
	sort.Strings(lines)
	return strings.Join(lines, "\n"), nil
}

type unstableLineOrderComparatorMatcher struct {
	kind
	unstableLineOrderComparator
	matchSpec
}
