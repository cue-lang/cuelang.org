package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod": {
						page: {
							cache: {
								multi_step: {
									hash:       "GGP6GHUMQ02A072647LATETPEHHCD7GCAIA8JASO4EJMUIM3EF4G===="
									scriptHash: "3RLO23CCG8UM3ONJ00P557CCJIJ7G9KSPFESV4TC18B73AJF0KK0===="
									steps: [{
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
												  get         add and upgrade module dependencies
												  init        initialize new module in current directory
												  publish     publish the current module to a registry
												  tidy        download and tidy module dependencies

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
