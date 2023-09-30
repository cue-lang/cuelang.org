package site

import (
	"github.com/cue-lang/cuelang.org/internal/ci"
)

// gen generates template files required for the building of the cuelang.org
// site.
command: gen: exec.Run & {
	cmd: ["go", "run", "github.com/cue-lang/cuelang.org/internal/cmd/writefs"]
	stdin: json.Marshal(template)
}
