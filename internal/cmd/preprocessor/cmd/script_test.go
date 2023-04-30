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
	"flag"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"testing"

	"cuelang.org/go/cmd/cue/cmd"
	"github.com/rogpeppe/go-internal/testscript"
)

func TestMain(m *testing.M) {
	os.Exit(testscript.RunMain(m, map[string]func() int{
		"preprocessor": Main,
		"cmd-find":     findCmd,
		"cue":          cueCmd,
	}))
}

func TestScripts(t *testing.T) {
	testscript.Run(t, testscript.Params{
		UpdateScripts: os.Getenv("CUE_UPDATE") != "",
		Dir:           "testdata",
	})
}

// findCmd is rather like Unix find. It is used to list files and directories
// contained by the working directory. By default neither .golden files nor
// directoriy paths are listed.
func findCmd() int {
	fDir := flag.Bool("dir", false, "print directory paths")
	fGolden := flag.Bool("golden", false, "print .golden files")
	flag.Parse()

	filepath.WalkDir(".", func(path string, d fs.DirEntry, err error) error {
		var printEntry bool
		if d.IsDir() {
			printEntry = *fDir
		} else {
			isGolden := filepath.Ext(d.Name()) == ".golden"
			printEntry = !isGolden || *fGolden
		}
		if printEntry {
			fmt.Printf("%s\n", path)
		}
		return nil
	})

	return 0
}

// cueCmd simulates cmd/cue
func cueCmd() int {
	return cmd.Main()
}
