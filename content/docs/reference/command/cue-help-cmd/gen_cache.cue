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
									hash:       "JL8PS7ALO3R6PEJHLHOLOBPN1NKPH0N9TLM0U29VCI62G3L3DPDG===="
									scriptHash: "8G27PC2AG29AR5C8N773CCD0T002HKSB08ET5S41KR13HCQKDB10===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4:$PATH"
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
