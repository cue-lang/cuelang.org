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
									hash:       "DOI34OU9ALLSKK1O27STGHK9EHE6DHB65ORD3Q0PKAEA0D8N95H0===="
									scriptHash: "72J3U4RB4BDARTSTG79QULQD2TB3PC41OVQ0F4P3LP80HRN5J5B0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
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
												  rename      rename the current module
												  resolve     Show how a module path resolves to a registry
												  tidy        download and tidy module dependencies

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
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
