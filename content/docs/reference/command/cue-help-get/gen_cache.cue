package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-get": {
						page: {
							cache: {
								multi_step: {
									hash:       "N08CDCVDNU1T0LFQD35S4AH13OLO5I23AQ23NA6MMDFDTPMIMEO0===="
									scriptHash: "HU3KJDG6VAMA7O78O4QUTMEC5SJIN3ME6MFJRDC1N5G08L43M2RG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2.0.20250328144635-721ca5db06fc:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help get"
										exitCode: 0
										output: """
												Get downloads packages or modules for non-CUE languages
												to include them in the module's pkg directory.

												Get requires an additional language field to determine for which
												language definitions should be fetched. Definitions are extracted
												from the source of the respective language and stored.
												The specifics on how dependencies are fetched and converted vary
												per language and are documented in the respective subcommands.

												For information on native CUE modules:

												    cue help modules

												Usage:
												  cue get <language> [packages] [flags]
												  cue get [command]

												Available Commands:
												  go          add Go dependencies to the current module

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --trace        trace computation
												  -v, --verbose      print information about progress

												Use "cue get [command] --help" for more information about a command.

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
