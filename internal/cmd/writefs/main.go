package main

import (
	"bytes"
	"encoding/json"
	"log"
	"os"
	"path/filepath"
)

type file struct {
	Type string

	// If typ == "symlink" this is the filepath of the target
	// otherwise it is the Contents of the file
	Contents string
}

type args struct {
	// Remove is a list of globs of files to remove. File
	// removal happens before file creation.
	Remove []string

	// Create is a map of file path (in Unix format) to contents.
	Create map[string]file
}

func main() {
	var todo args
	dec := json.NewDecoder(os.Stdin)
	if err := dec.Decode(&todo); err != nil {
		log.Fatalf("failed to decode arguments from stdin: %v", err)
	}
	for _, glob := range todo.Remove {
		files, err := filepath.Glob(glob)
		if err != nil {
			log.Fatalf("failed to glob %q: %v", glob, err)
		}
		if len(files) == 0 {
			continue
		}
		for _, f := range files {
			if err := os.Remove(f); err != nil {
				log.Fatalf("failed to remove %s: %v", f, err)
			}
		}
	}
	for fp, f := range todo.Create {
		fp = filepath.FromSlash(fp)
		dir := filepath.Dir(fp)
		if err := os.MkdirAll(dir, 0o777); err != nil {
			log.Fatalf("failed to mkdir %s: %v", dir, err)
		}
		switch f.Type {
		case "symlink":
			target := filepath.FromSlash(f.Contents)
			actualTarget, err := os.Readlink(fp)
			if err == nil && actualTarget == target {
				continue
			}
			if err := os.Symlink(target, fp); err != nil {
				log.Fatalf("failed to symlink %s -> %s: %v", fp, target, err)
			}
		case "file":
			// If we have a .json file, normalise the contents first
			// as a special case.
			//
			// TODO: this actually belongs as an option in CUE.
			contents := []byte(f.Contents)
			if filepath.Ext(fp) == ".json" {
				var i any
				err := json.Unmarshal(contents, &i)
				if err == nil {
					var b bytes.Buffer
					enc := json.NewEncoder(&b)
					enc.SetEscapeHTML(false)
					enc.SetIndent("", "    ")
					if err := enc.Encode(i); err == nil {
						// Add a trailing newline
						contents = b.Bytes()
					}
				}
			}
			if err := os.WriteFile(fp, []byte(contents), 0o666); err != nil {
				log.Fatalf("failed to write file %s: %v", fp, err)
			}
		}
	}
}
