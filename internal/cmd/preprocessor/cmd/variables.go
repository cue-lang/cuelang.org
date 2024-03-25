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
	"crypto/rand"
	"crypto/sha256"
	"fmt"
	"regexp"
	"strings"
)

type pageVar interface {
	value() string
	transformedValue() string
}

type stringVar string

var _ pageVar = stringVar("")

func (s stringVar) value() string {
	return string(s)
}

func (s stringVar) transformedValue() string {
	return s.value()
}

type randomVariable struct {
	Pattern     string `json:"pattern"`
	Replacement string `json:"replacement"`
	val         string
}

var _ pageVar = randomVariable{}

func (r randomVariable) value() string {
	return r.val
}

func (r randomVariable) transformedValue() string {
	return r.Replacement
}

func newRandomVariable(rv randomVariable) randomVariable {
	rv.val = generateRandomValue(rv.Pattern)
	return rv
}

const (
	patternPrefix = "${"
	patternSuffix = "}"
)

var (
	lowerHex = buildRandomVariablePattern(`x+`)
	upperHex = buildRandomVariablePattern(`X+`)
	integer  = buildRandomVariablePattern(`d+`)
)

func buildRandomVariablePattern(pattern string) *regexp.Regexp {
	patternPrefixMeta := regexp.QuoteMeta(patternPrefix)
	patternSuffixMeta := regexp.QuoteMeta(patternSuffix)
	return regexp.MustCompile(patternPrefixMeta + pattern + patternSuffixMeta)
}

// generateRandomValue generates a random string value based on the
// template pattern. generateRandomValue recognises the following
// templates in pattern:
//
// x+ - a lower-case hex value
// X+ - an upper-case hex value
// d+ - an integer
//
// Each template is replaced with a random value of equivalent length.
func generateRandomValue(pattern string) string {
	res := pattern
	res = lowerHex.ReplaceAllStringFunc(res, func(s string) string {
		return replaceString(s, func() string { return getRand("%x") })
	})
	res = upperHex.ReplaceAllStringFunc(res, func(s string) string {
		return replaceString(s, func() string { return getRand("%X") })
	})
	res = integer.ReplaceAllStringFunc(res, func(s string) string {
		return replaceString(s, getRandInteger)
	})
	return res
}

// replaceString returns res, a replacement for s, such that len(s) ==
// len(res).  The generator f is called to "build" res. f can be called
// multiple times in order to build a sufficiently long res.
func replaceString(s string, f func() string) (res string) {
	// s will have the patternPrefix and patternSuffix
	s = s[len(patternPrefix) : len(s)-len(patternSuffix)]
	var b strings.Builder
	for len(s) > 0 {
		r := f()
		i := min(len(s), len(r))
		b.WriteString(r[:i])
		s = s[i:]
	}
	return b.String()
}

// getRand returns a random string, formatted according to pattern.
func getRand(pattern string) string {
	b := make([]byte, 32)
	if _, err := rand.Read(b); err != nil {
		panic(err)
	}
	h := sha256.Sum256(b)
	return fmt.Sprintf(pattern, h)
}

// getRandInteger returns the string format of a random integer.  Large integer
// values are "faked" from large string values using getRand("%x") as the
// source, replacing alpha hex values with their numeric equivalents.
func getRandInteger() string {
	r := getRand("%x")
	r = strings.ReplaceAll(r, "a", "10")
	r = strings.ReplaceAll(r, "b", "11")
	r = strings.ReplaceAll(r, "c", "12")
	r = strings.ReplaceAll(r, "d", "13")
	r = strings.ReplaceAll(r, "e", "14")
	r = strings.ReplaceAll(r, "f", "15")
	return r
}
