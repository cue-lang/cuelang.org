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
	"cuelang.org/go/cue/parser"
	"cuelang.org/go/cue/token"
	"cuelang.org/go/encoding/json"
	"cuelang.org/go/encoding/yaml"
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

func handleCUECompile(in input, origFn function, out output, inputVal string) (string, error) {
	// fn is the effective function. origFunction is what we were called with.
	// See below for comment about how formatting of CUE code changes the
	// effective function.
	fn := origFn

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

		// If CUE is being formatted we can short-circuit with a trivial parse and format of AST.
		// For JSON and Yaml we fall through to an export
		switch in {
		case inputCUE:
			return formatCUE(inputVal), nil
		case inputJSON, inputYaml:
			// For JSON and Yaml we effectively perform an export, knowing from
			// our earlier check that the output filetype matches the input. So
			// whilst not necessarily the most efficient we know it will work like
			// cmd/cue.
			fn = functionExport
		default:
			return "", fmt.Errorf("don't know how to format %q", in)
		}
	}

	// In case we are formatting, we don't want to return an error, rather the
	// original value. Rather that litter lots of return paths with this logic
	// below, wrap up in a closure
	//
	// Only call with a non-nil error.
	origOrErr := func(err error) (string, error) {
		if err == nil {
			panic("only call with a non-nil error")
		}
		if origFn == functionFmt {
			return inputVal, nil
		}
		return "", err
	}

	ctx := cuecontext.New()
	var v cue.Value

	switch in {
	case inputCUE:

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
			return origOrErr(fmt.Errorf("failed to load: %w", err))
		}

		v = ctx.BuildInstance(builds[0])
	case inputJSON:
		e, err := json.Extract("-", []byte(inputVal))
		if err != nil {
			return origOrErr(fmt.Errorf("failed to extract JSON: %w", err))
		}
		v = ctx.BuildExpr(e)
	case inputYaml:
		f, err := yaml.Extract("-", inputVal)
		if err != nil {
			return origOrErr(fmt.Errorf("failed to extract Yaml: %w", err))
		}
		v = ctx.BuildFile(f)
	}

	if err := v.Err(); err != nil {
		return origOrErr(fmt.Errorf("failed to build: %w", err))
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
		return origOrErr(err)
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
		return origOrErr(fmt.Errorf("failed to build encoder: %v", err))
	}

	// TODO(mvdan): Note that formatOpts appear to do nothing at all.
	// For instance, the tests indent JSON with four spaces instead of two.
	//
	// TODO(myitcv): make the sharing of format options consistent with
	// formatCUE.
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
		return origOrErr(fmt.Errorf("failed to encode: %w", err))
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

func formatCUE(s string) string {
	f, err := parser.ParseFile("cue:-", s, parser.ParseComments)
	if err != nil {
		// Simply return the input, i.e. leave the input untouched. This is what
		// the LSP does. Because like the LSP, the user will already be able to
		// see from the RHS that there is an error in the LHS. They don't need a
		// further error telling them that the code cannot be parsed.
		return s
	}

	// TODO(myitcv): make the sharing of format options consistent with
	// handleCUECompile.
	b, err := format.Node(f, format.TabIndent(true))
	if err != nil {
		return s
	}
	return string(b)
}
