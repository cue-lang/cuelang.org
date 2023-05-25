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
	"bytes"
	"hash"
	"io"
)

// loggingSha256Hash is a simple wrapper around a sha256 hash and a
// bytes.Buffer that also logs writes to the former to the latter.
// This is particularly useful in debugging cache hits/misses.
type loggingSha256Hash struct {
	h hash.Hash
	b bytes.Buffer
	w io.Writer
}

func (l *loggingSha256Hash) Write(b []byte) (int, error) {
	return l.w.Write(b)
}

func (l *loggingSha256Hash) Sum(b []byte) []byte {
	return l.h.Sum(b)
}

func (l *loggingSha256Hash) Reset() {
	l.h.Reset()
	l.b.Reset()
}

func (l *loggingSha256Hash) Size() int {
	return l.h.Size()
}

func (l *loggingSha256Hash) BlockSize() int {
	return l.h.BlockSize()
}
