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

package main

import (
	"bytes"
	"crypto/sha256"
	"encoding/base64"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"sort"
)

var (
	fVerbose = flag.Bool("v", false, "verbose logging")
)

func main() {
	log.SetFlags(0)
	flag.Parse()

	if os.Getenv("GOPACKAGE") == "" {
		log.Fatalf("GOPACKAGE is not set")
	}

	// Build a map of the files to ignore
	toIgnore := make(map[string]bool)
	for _, a := range flag.Args() {
		fp, err := filepath.Abs(a)
		if err != nil {
			log.Fatalf("failed to make %s absolute: %v", a, err)
		}
		toIgnore[fp] = true
	}

	// Get the main module
	modCmd := exec.Command("go", "list", "-m", "-json")
	modOut, err := modCmd.CombinedOutput()
	if err != nil {
		log.Fatalf("failed to determine main module path via [%v]: %v", modCmd, err)
	}
	var mainMod listModule
	if err := json.Unmarshal(modOut, &mainMod); err != nil {
		log.Fatalf("failed to decode main module information: %v", err)
	}

	// Verify we are in the right module!
	const thisModule = "github.com/cue-lang/cuelang.org"
	if mainMod.Path != thisModule {
		log.Fatalf("main module is %s; expected %s", mainMod.Path, thisModule)
	}

	// Start out list of files to hash
	filesToHash := []string{
		filepath.Join(mainMod.Dir, "go.mod"),
		filepath.Join(mainMod.Dir, "go.sum"),
	}

	depsCmd := exec.Command("go", "list", "-e", "-deps", "-json", "github.com/cue-lang/cuelang.org/internal/cmd/preprocessor")
	depsOut, err := depsCmd.CombinedOutput()
	if err != nil {
		log.Fatalf("failed to determine deps via [%v]: %v\n%s", depsCmd, err, depsOut)
	}

	// Iterate through, and for each package that belongs to the main module,
	// hash all of the files. Even the ignored ones. This ensures we remain
	// cross-platform.
	dec := json.NewDecoder(bytes.NewReader(depsOut))
	for {
		var p listPackage
		if err := dec.Decode(&p); err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			log.Fatalf("failed to decode package deps: %v", err)
		}
		if p.Module == nil || p.Module.Path != thisModule {
			continue
		}
		add := func(files []string) {
			for _, f := range files {
				filesToHash = append(filesToHash, filepath.Join(p.Dir, f))
			}
		}
		add(p.GoFiles)
		add(p.CgoFiles)
		add(p.CompiledGoFiles)
		add(p.IgnoredGoFiles)
		add(p.IgnoredOtherFiles)
		add(p.CFiles)
		add(p.CXXFiles)
		add(p.MFiles)
		add(p.HFiles)
		add(p.FFiles)
		add(p.SFiles)
		add(p.SwigFiles)
		add(p.SwigCXXFiles)
		add(p.SysoFiles)
		add(p.EmbedFiles)
	}

	sort.Strings(filesToHash)

	h := sha256.New()
	for _, fn := range filesToHash {
		if toIgnore[fn] {
			continue
		}
		rel, err := filepath.Rel(mainMod.Dir, fn)
		if err != nil {
			log.Fatalf("failed to calculate %s relative to %s", fn, mainMod.Dir)
		}
		debugf("hashing %s\n", fn)
		fmt.Fprintf(h, "== %s ==\n", rel)
		f, err := os.Open(fn)
		if err != nil {
			log.Fatalf("failed to open %s: %v", fn, err)
		}
		if _, err := io.Copy(h, f); err != nil {
			log.Fatalf("failed to hash %s: %v", fn, err)
		}
		f.Close()
	}

	selfHash := base64.StdEncoding.EncodeToString(h.Sum(nil))

	// Write to gen_pkghash.go for the current pkg
	var out bytes.Buffer
	fmt.Fprintf(&out, "// Code generated internal/cmd/genpkghash; DO NOT EDIT.\n")
	fmt.Fprintf(&out, "\n")
	fmt.Fprintf(&out, "package %s\n", os.Getenv("GOPACKAGE"))
	fmt.Fprintf(&out, "\n")
	fmt.Fprintf(&out, "var selfHash = %q\n", selfHash)

	const target = "gen_pkghash.go"
	if err := os.WriteFile(target, out.Bytes(), 0666); err != nil {
		log.Fatalf("failed to write to %s: %v", target, err)
	}
}

func debugf(format string, args ...any) {
	if *fVerbose {
		log.Printf(format, args...)
	}
}

type listPackage struct {
	ImportPath string
	Name       string
	Module     *listModule
	Dir        string

	GoFiles           []string
	CgoFiles          []string
	CompiledGoFiles   []string
	IgnoredGoFiles    []string
	IgnoredOtherFiles []string
	CFiles            []string
	CXXFiles          []string
	MFiles            []string
	HFiles            []string
	FFiles            []string
	SFiles            []string
	SwigFiles         []string
	SwigCXXFiles      []string
	SysoFiles         []string

	EmbedFiles []string

	Error any
}

type listModule struct {
	Path string
	Dir  string
}
