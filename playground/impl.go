// Copyright 2020 The CUE Authors
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

package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/cue/token"
	cueyaml "cuelang.org/go/encoding/yaml"
)

type function string

const (
	functionExport function = "export"
	functionEval   function = "eval"
	functionDef    function = "def"
	functionFmt    function = "fmt"
)

type input string

const (
	inputCUE  input = "cue"
	inputJSON input = "json"
	inputYaml input = "yaml"
)

type output string

const (
	outputCUE  output = output(inputCUE)
	outputJSON output = output(inputJSON)
	outputYaml output = output(inputYaml)
)

func handleCUECompile(in input, fn function, out output, inputVal string) (string, error) {
	// TODO implement more functions
	switch fn {
	case functionExport, functionEval, functionDef, functionFmt:
	default:
		return "", fmt.Errorf("function %q is not implemented", fn)
	}

	switch in {
	case inputCUE, inputJSON, inputYaml:
	default:
		return "", fmt.Errorf("unknown input type: %v", in)
	}

	switch out {
	case outputCUE, outputJSON, outputYaml:
	default:
		return "", fmt.Errorf("unknown ouput type: %v", out)
	}

	if fn == functionFmt {
		// For Fmt, we require in and out to be the same.
		if in != input(out) {
			return "", fmt.Errorf("fmt input output mismatch: input = %q, output = %q", in, out)
		}

		// Error in case we are trying to format something we can't
		switch in {
		case inputCUE, inputJSON:
		default:
			return "", fmt.Errorf("don't (yet) know how to format %q", in)
		}

		return formatInput(in, inputVal), nil
	}

	loadCfg := &load.Config{
		Stdin:      strings.NewReader(inputVal),
		Dir:        "/",
		ModuleRoot: "/",
		Overlay: map[string]load.Source{
			"/cue.mod/module.cue": load.FromString(`
				module: "example.test"
				language: version: "v0.9.0"
			`),
		},
	}
	builds := load.Instances([]string{string(in) + ":", "-"}, loadCfg)
	if err := builds[0].Err; err != nil {
		return "", fmt.Errorf("failed to load: %w", err)
	}

	ctx := cuecontext.New()

	v := ctx.BuildInstance(builds[0])
	if err := v.Err(); err != nil {
		return "", fmt.Errorf("failed to build: %w", err)
	}
	syntaxOpts := []cue.Option{
		cue.Docs(true),
		cue.Attributes(true),
		cue.Optional(true),
		cue.Definitions(true),
	}
	var validateOpts []cue.Option
	switch fn {
	case functionEval:
		// Don't want to validate cue.Final() here - because that would generate
		// errors in cases like the following:
		//
		//     x: string
		//     y: (x): string
		//
		// But we do want to select defaults in the rendered value, to behave like
		// cue eval
		syntaxOpts = append(syntaxOpts, cue.Final())
	case functionExport:
		// cue.Concrete(true) implies cue.Final()
		validateOpts = append(validateOpts, cue.Concrete(true))
	}

	// Given that we validate first, any validation opts must also apply for
	// syntax (if they are irrelevant then cue.Value.Syntax will ignore them).
	syntaxOpts = append(syntaxOpts, validateOpts...)

	if err := v.Validate(validateOpts...); err != nil {
		return "", err
	}

	// TODO(mvdan): once we have a consistent interface for encodings,
	// this could possibly be an exposed API upstream, much like cue/load
	// already knows how to decode each of these.
	// For now, we emulate the essence of what cmd/cue does via internal/encoding
	// to encode a CUE value as CUE, JSON, and YAML.
	var dst []byte
	var err error
	switch out {
	case outputCUE:
		node := v.Syntax(syntaxOpts...)
		dst, err = format.Node(toFile(node))
	case outputJSON:
		dst, err = json.MarshalIndent(v, "", "    ")
		dst = append(dst, '\n')
	case outputYaml:
		dst, err = cueyaml.Encode(v)
	}
	if err != nil {
		return "", fmt.Errorf("failed to encode: %w", err)
	}
	return string(dst), nil
}

// toFile is copied from CUE's internal.toFile;
// mainly needed so that CUE outputs don't always contain braces
// for the top-level struct in a value.
func toFile(n ast.Node) *ast.File {
	if n == nil {
		return nil
	}
	switch n := n.(type) {
	case *ast.StructLit:
		f := &ast.File{Decls: n.Elts}
		// Ensure that the comments attached to the struct literal are not lost.
		ast.SetComments(f, ast.Comments(n))
		return f
	case ast.Expr:
		ast.SetRelPos(n, token.NoSpace)
		return &ast.File{Decls: []ast.Decl{&ast.EmbedDecl{Expr: n}}}
	case *ast.File:
		return n
	default:
		panic(fmt.Sprintf("Unsupported node type %T", n))
	}
}

// formatInput attempts to format s according to the filetype in. On success it
// returns the formatted result, otherwise it returns s. formatInput panics on
// an unsupported in filetype.
func formatInput(in input, s string) string {
	switch in {
	case inputCUE:
		// TODO(myitcv): make the sharing of format options consistent with
		// handleCUECompile.
		b, err := format.Source([]byte(s), format.TabIndent(true))
		if err != nil {
			return s
		}
		return string(b)
	case inputJSON:
		var buf bytes.Buffer
		if err := json.Indent(&buf, []byte(s), "", "  "); err != nil {
			return s
		}
		return buf.String()
	default:
		panic(fmt.Errorf("don't know how to format %q", in))
	}
}
