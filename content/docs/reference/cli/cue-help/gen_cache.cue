package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-help": {
						page: {
							cache: {
								multi_step: {
									hash:       "B2N5N6NUT9T41A0U5HI4C36PH9QE57TT5NRRAO4NJQE1HATSF41G===="
									scriptHash: "0N74T1HN80F3G0IGVDBV649NQN5L4O1IB4C2QKT0AQ6QN3147ITG===="
									steps: [{
										doc:      ""
										cmd:      "cue help help"
										exitCode: 0
										output: """
												Help provides help for any command in the application.
												Simply type cue help [path to command] for full details.

												Usage:
												  cue help [command] [flags]

												Flags:
												  -h, --help   help for help

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
