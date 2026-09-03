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
									hash:       "BKKQDIMJ90VITRIFC4FVNMAROLG2T7P1CJN07AMD2S9VGG2HG59G===="
									scriptHash: "33MIBU80P67CQK8AVRN8GCBF9S5EDUHGAE4R8KF5NRSAQPG4II5G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.17.0:$PATH"
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
