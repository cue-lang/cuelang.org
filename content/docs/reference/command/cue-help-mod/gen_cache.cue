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
									hash:       "EDANJ847IU37N6HHM32831P1COHDJCJEHF8REFV7EKJEHD4IUM8G===="
									scriptHash: "CDN2FTVPNMJ2EPS4ENLUADNG6C9279T32367RKHBGEULRJ0650NG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
												  upgrade     upgrade the module to a new language version

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
