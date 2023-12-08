package cli

import (
	"tool/exec"
	"encoding/json"

	"github.com/cue-lang/cuelang.org/content/docs/reference/cli:site"
)

// FIXME
command: genCliHelpTexts: {
	texts: {
		for _name, _config in site.content.docs.reference.cli.texts {
			(_name): exec.Run & _config & {
				stdout:  string
				stderr:  string
				success: true
			}
		}
	}
	write: exec.Run & {
		cmd: ["go", "run", "github.com/cue-lang/cuelang.org/internal/cmd/writefs"]
		stdin: json.Marshal({
			site.content.docs.reference.cli.fs & {
				#texts: genCliHelpTexts.texts
			}})
	}
}
