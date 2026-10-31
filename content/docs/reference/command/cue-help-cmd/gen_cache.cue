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
									hash:       "8AQQ98IEQ3FVQB39IP2LO6COT9I1AAUKTJJ7IE3KE3SFR1JBK5E0===="
									scriptHash: "O6OKPKNBE9JH344RGFMIT2R3M6MCHB31KBSN2SASITPI8E9P111G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
												  -t, --inject stringArray         set the value of a tagged field
												  -T, --inject-vars[=true|false]   inject system variables in tags (default true)
												      --language-version string    fallback language version for input outside a module (for example, v0.17.0)

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
