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
									hash:       "AJ141O1DGKEL5PFN9T1SGFC8PM0DVOR2MA8P6HLEG0PG3E4K29HG===="
									scriptHash: "C305JBDD8EGHRAH9SHHUR8EI7P0NIHC31F2R4CEULQ2KNU3GAQVG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250322080417-cfbeb48088c9:$PATH"
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
