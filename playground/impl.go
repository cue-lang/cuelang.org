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
	"fmt"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/ast"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/format"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/cue/token"
	"cuelang.org/go/pkg/encoding/json"
	"github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal/encoding"
	"github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal/filetypes"
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
	cueOpts := []cue.Option{
		cue.Docs(true),
		cue.Attributes(true),
		cue.Optional(true),
		cue.Definitions(true),
	}
	switch fn {
	case functionEval:
		cueOpts = append(cueOpts, cue.Final())
	case functionExport:
		cueOpts = append(cueOpts, cue.Final(), cue.Concrete(true))
	}
	if err := v.Validate(cueOpts...); err != nil {
		return "", err
	}
	f, err := filetypes.ParseFile(string(out)+":-", filetypes.Export)
	if err != nil {
		var buf bytes.Buffer
		errors.Print(&buf, err, nil)
		panic(fmt.Errorf("failed to parse file from %v: %s", string(out)+":-", buf.Bytes()))
	}
	var outBuf bytes.Buffer
	encConf := &encoding.Config{
		Out: &outBuf,
	}
	e, err := encoding.NewEncoder(ctx, f, encConf)
	if err != nil {
		return "", fmt.Errorf("failed to build encoder: %v", err)
	}

	// TODO(mvdan): Note that formatOpts appear to do nothing at all.
	// For instance, the tests indent JSON with four spaces instead of two.
	//
	// TODO(myitcv): make the sharing of format options consistent with
	// formatInput.
	var formatOpts []format.Option
	switch out {
	case outputCUE:
		formatOpts = append(formatOpts, format.TabIndent(true))
	case outputJSON, outputYaml:
		formatOpts = append(formatOpts,
			format.TabIndent(false),
			format.UseSpaces(2),
		)
	}
	encConf.Format = formatOpts
	synF := getSyntax(v, cueOpts)
	if err := e.EncodeFile(synF); err != nil {
		return "", fmt.Errorf("failed to encode: %w", err)
	}
	return outBuf.String(), nil
}

// getSyntax is copied from cmd/cue/cmd/eval.go
func getSyntax(v cue.Value, opts []cue.Option) *ast.File {
	n := v.Syntax(opts...)
	switch x := n.(type) {
	case *ast.File:
		return x
	case *ast.StructLit:
		return &ast.File{Decls: x.Elts}
	case ast.Expr:
		ast.SetRelPos(x, token.NoSpace)
		return &ast.File{Decls: []ast.Decl{&ast.EmbedDecl{Expr: x}}}
	default:
		panic("unreachable")
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
		res, err := json.Indent([]byte(s), "", "  ")
		if err != nil {
			return s
		}
		return res
	default:
		panic(fmt.Errorf("don't know how to format %q", in))
	}
}
