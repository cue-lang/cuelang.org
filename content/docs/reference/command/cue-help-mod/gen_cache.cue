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
									hash:       "G9BPONN7H5P6PQF6BGGM8Q95TEGTFHN45S2FIMDJO3B1OT1KHUV0===="
									scriptHash: "HU7L68IJ4QUKFPRML2QM1QFHHQHFJK9G65DTNVBR0MAD335LN6TG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0:$PATH"
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
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
