package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-cmd": {
						page: {
							cache: {
								multi_step: {
									hash:       "IL4QF69O0VEMQ1O6TSKVATOAAE6NMIO47NTF5TMUDBPETVA6MRG0===="
									scriptHash: "0C4EGGASTL826KI8UK6RS1NHHFBJ17821H3EKPJPANDV2K5526A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20260918143709-50e1f64b6460:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help cmd"
										exitCode: 0
										output: """
												cmd executes the named workflow command for each of the named instances.

												Workflow commands are defined in tool files, which are regular CUE
												files within the same package with a filename ending in _tool.cue.

												Run "cue help commands" for more details on authoring tasks and
												workflow commands.

												Usage:
												  cue cmd [flags] <name> [inputs]

												Flags:
												  -t, --inject stringArray   set the value of a tagged field
												  -T, --inject-vars          inject system variables in tags (default true)

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
