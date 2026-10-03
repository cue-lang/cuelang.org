package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod": {
						page: {
							cache: {
								multi_step: {
									hash:       "989KIUSAO55BV8LNCVT9FUOTQHJCJN1ECQKTC66SBE1IER3BH8M0===="
									scriptHash: "VQ3Q5EHG71JQ7P4701JIBTJICPF8KUBL50EPTK0KTCJQ2D63JS50===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod"
										exitCode: 0
										output: """
												Mod groups commands which operate on CUE modules.

												Note that support for modules is built into all the cue commands, not
												just 'cue mod'.

												See also:
												\tcue help modules

												Usage:
												  cue mod <cmd> [arguments] [flags]
												  cue mod [command]

												Available Commands:
												  edit        edit cue.mod/module.cue
												  fix         fix a legacy cue.mod/module.cue file
												  get         add and upgrade module dependencies
												  init        initialize new module in current directory
												  mirror      mirror module content between registries
												  publish     publish the current module to a registry
												  registry    start a local in-memory module registry
												  rename      rename the current module
												  resolve     Show how a module path resolves to a registry
												  tidy        download and tidy module dependencies

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors

												Use "cue mod [command] --help" for more information about a command.

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
