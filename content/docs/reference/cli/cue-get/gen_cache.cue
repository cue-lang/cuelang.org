package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-get": {
						page: {
							cache: {
								multi_step: {
									hash:       "JGBD3RT230LS74D3T4N6GFEIILBABTM1PMDP94M2ODOGGLHRTQU0===="
									scriptHash: "4P7F49JFRO51HPGJIBV5MSPIBFHC4MSFQRP7AEU44P7NJTNT1B00===="
									steps: [{
										doc:      ""
										cmd:      "cue help get"
										exitCode: 0
										output: """
												Get downloads packages or modules for CUE or another language
												to include them in the module's pkg directory.

												Get requires an additional language field to determine for which
												language definitions should be fetched. If get fetches definitions
												for a language other than CUE, the definitions are extracted from
												the source of the respective language and stored.
												The specifics on how dependencies are fechted and converted vary
												per language and are documented in the respective subcommands.

												Usage:
												  cue get <language> [packages] [flags]
												  cue get [command]

												Available Commands:
												  go          add Go dependencies to the current module

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
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
