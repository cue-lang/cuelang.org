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
									hash:       "0EHTODMFM9R0J4QD5L1O8D9K8GKJNRDI8D1BME19HMLLFS682H8G===="
									scriptHash: "79OJH797643L3OT1S1GOOPK3R5JKB91URRIJQ0DBSAFJSV50T5UG===="
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
