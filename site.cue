package site

import (
	"github.com/cue-lang/cuelang.org/internal/ci"
)

versions: {
	go:         "go1.21.1"
	cue:        "v0.6.0"
	testscript: "v1.10.0"
}

// template is an io/fs.FS-like map of files that are templated
// by site_tool.cue:gen for the working of cuelang.org
template: ci.#writefs & {

}
