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
									hash:       "88I7FFJ0VRUR31CS11K23L41URFOT6HKA01S8DNKUET0PQEHF55G===="
									scriptHash: "HBH6SO3VMC6OPUMPS472SHM3KR5BAT3DB4OGPN6P1CA484KBBS70===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
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
