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
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"github.com/spf13/cobra"
)

func newImportCmd(c *Command) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "import",
		Short: "Import /hugo/content to /content",
		RunE:  mkRunE(c, importDef),
	}
	return cmd
}

type importContext struct {
	// projectRoot is the absolute path root of the project that contains the
	// current working directory which is "." for import
	projectRoot string

	// hugoContent is the absolute path to the source hugo/content directory.
	hugoContent string

	// content is the absolute path to the target content directory.
	content string
}

// importDef is the implementation of the import command. import performs
// a one-off import from hugo/content to content.
func importDef(c *Command, args []string) error {
	_, projectRoot, err := deriveProjectRoot(".")

	// Walk the hugo/content directory entries, looking for directories
	// in supported languages

	ic := &importContext{
		projectRoot: projectRoot,
		hugoContent: filepath.Join(projectRoot, "hugo", "content"),
		content:     filepath.Join(projectRoot, "content"),
	}

	dirEntries, err := os.ReadDir(ic.hugoContent)
	if err != nil {
		return fmt.Errorf("failed to list %s: %w", ic.hugoContent, err)
	}
	for _, dirEntry := range dirEntries {
		// Only want directories
		if !dirEntry.IsDir() {
			continue
		}

		// ... in supported languages
		var found bool
		for _, sl := range supportedLanguages {
			if dirEntry.Name() == string(sl) {
				found = true
				break
			}
		}
		if !found {
			continue
		}

		// We found a support language directory. Walk and copy all content
		// to the corresponding /content dir and file
		ldc := ic.newImportLangDirContext(dirEntry.Name())
		err := filepath.WalkDir(ldc.langRootDir, ldc.importHugoLangDir)
		if err != nil {
			return fmt.Errorf("failed to import from %s: %w", ldc.langRootDir, err)
		}
	}

	return nil
}

type importLangDirContext struct {
	ic          *importContext
	lang        string
	langRootDir string
}

func (ic *importContext) newImportLangDirContext(lang string) *importLangDirContext {
	return &importLangDirContext{
		ic:          ic,
		lang:        lang,
		langRootDir: filepath.Join(ic.hugoContent, lang),
	}
}

func (ldc *importLangDirContext) importHugoLangDir(path string, d os.DirEntry, err error) error {
	// We can't tolerate errors in this walk
	if err != nil {
		return err
	}
	// We only copy files
	if d.IsDir() {
		return nil
	}
	rel, err := filepath.Rel(ldc.langRootDir, path)
	if err != nil {
		return fmt.Errorf("failed to determine %s relative to %s: %w", path, ldc.langRootDir, err)
	}
	relDir, base := filepath.Split(rel)
	base = strings.Replace(base, "index", ldc.lang, 1)
	targetDir := filepath.Join(ldc.ic.content, relDir)
	if err := os.MkdirAll(targetDir, 0777); err != nil {
		return fmt.Errorf("failed to ensure %s exists: %w", targetDir, err)
	}
	target := filepath.Join(targetDir, base)
	if err := copyFile(path, target); err != nil {
		return fmt.Errorf("failed to copy %s to %s: %w", path, target, err)
	}
	return nil
}
