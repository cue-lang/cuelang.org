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
									hash:       "K6KVTUDOQ20LVL64KH2CK4SEV1F9IP2L0CH6E4OE79U4S39HFBH0===="
									scriptHash: "NV9BLBP8KO0EB3A3NN8PHB6F1V5J9NHLC8I0JFQI7IEBOL0UCDV0===="
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
