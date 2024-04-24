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
									hash:       "UA27CQT9LA24NMOIJM75JUOAK81CP3JHKJF8H5KSGK42MD1KG110===="
									scriptHash: "UPNLLN21T4UHEB5TN2S77QOJV7DMCK1VQD403VJO8BM7074EO2I0===="
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
