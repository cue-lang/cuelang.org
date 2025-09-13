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
									hash:       "ASJH6SD1A8JGJKKSL83O3OMQ71FVA6ASO1EFS5T5B8NDETUEI920===="
									scriptHash: "4NH1GOFR5J88I07CVSEIKE205T49J2LCH1P1SQ8L88SHA7SERBDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.1.0.20250913190050-8572198e1792:$PATH"
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
												  crd         convert Kubernetes CRDs to packages in the current module
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
