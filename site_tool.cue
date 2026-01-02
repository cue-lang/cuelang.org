package site

import (
	"encoding/json"
	"tool/exec"
)

// gen generates template files required for the building of the cuelang.org
// site.
command: gen: exec.Run & {
	cmd: ["go", "tool", "cue", "exp", "writefs"]
	stdin: json.Marshal(template)
}
