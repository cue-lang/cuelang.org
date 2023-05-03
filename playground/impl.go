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
	"github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal/encoding"
	"github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal/filetypes"
)

//go:generate ./_scripts/cpWasmExec.bash

type function string

const (
	functionExport function = "export"
	functionDef    function = "def"
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
	case functionExport, functionDef:
	default:
		return "", fmt.Errorf("function %q is not implemented", fn)
	}

	switch in {
	case inputCUE, inputJSON, inputYaml:
	default:
		return "", fmt.Errorf("unknown input type: %v", in)
	}
	loadCfg := &load.Config{
		Stdin:      strings.NewReader(inputVal),
		Dir:        "/",
		ModuleRoot: "/",
		Overlay: map[string]load.Source{
			"/cue.mod/module.cue": load.FromString(`module: "example.com"`),
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
	concrete := true
	switch out {
	case outputCUE:
		concrete = false
	case outputJSON, outputYaml:
	default:
		return "", fmt.Errorf("unknown ouput type: %v", out)
	}
	if err := v.Validate(cue.Concrete(concrete)); err != nil {
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
	e, err := encoding.NewEncoder(f, encConf)
	if err != nil {
		return "", fmt.Errorf("failed to build encoder: %v", err)
	}

	syn := []cue.Option{
		cue.Docs(true),
		cue.Attributes(true),
		cue.Optional(true),
		cue.Definitions(true),
	}
	var opts []format.Option
	switch out {
	case outputCUE:
		if fn != functionDef {
			syn = append(syn, cue.Concrete(true))
		}
		opts = append(opts, format.TabIndent(true))
	case outputJSON, outputYaml:
		opts = append(opts,
			format.TabIndent(false),
			format.UseSpaces(2),
		)
	}
	encConf.Format = opts
	synF := getSyntax(v, syn)
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
