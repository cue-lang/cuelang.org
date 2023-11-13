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
	"sort"
	"strings"
	"sync"
)

// A comparator normalizes a cmd's output to transformedOutput, replacing parts
// of output that are known to vary in particular ways with rand, a predefined
// pseudo-random value under the control of the caller. This allows for two
// such command outputs that differ only in known ways to be compared as
// bytes-equal after normalization.
type comparator interface {
	normalize(cmd *commandStmt, output string, rand string) (transformedOutput string, err error)
}

// A patternSanitiser replaces command output that matches
// a regular expression pattern some some replacement text.
type patternComparator struct {
	patternKindAndCommand
}

func (p *patternComparator) normalize(cmd *commandStmt, output string, rand string) (string, error) {
	if err := sync.OnceValue(p.init)(); err != nil {
		return "", err
	}

	if matched, err := p.matches(cmd); err != nil || !matched {
		return "", err
	}

	if p.Pattern.Linewise {
		lines := strings.Split(output, "\n")
		for i := range lines {
			// TODO: this is wrong, we should only replace the entire pattern when
			// there are no captured results. When there are captured results, we
			// should only replace those.
			lines[i] = p.pattern.ReplaceAllString(lines[i], rand)
		}
		return strings.Join(lines, "\n"), nil
	} else {
		// TODO: this is wrong, we should only replace the entire pattern when
		// there are no captured results. When there are captured results, we
		// should only replace those.
		return p.pattern.ReplaceAllString(output, rand), nil
	}
}

// An unstableLineOrderComparator lexigraphically sorts the lines
// a regular expression pattern some some replacement text.
type unstableLineOrderComparator struct {
	patternKindAndCommand
}

func (u *unstableLineOrderComparator) normalize(cmd *commandStmt, output string, rand string) (string, error) {
	if err := sync.OnceValue(u.init)(); err != nil {
		return "", err
	}

	if matched, err := u.matches(cmd); err != nil || !matched {
		return "", err
	}

	lines := strings.Split(output, "\n")
	sort.Strings(lines)
	return strings.Join(lines, "\n"), nil
}
