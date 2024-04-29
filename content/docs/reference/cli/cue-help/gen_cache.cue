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
									hash:       "L289STH81DUMEO736FBOET93CGPIKVMVVE7RNSGCN4NRO72LMS0G===="
									scriptHash: "SNTS32B02D6TC70B29ELJDCK37URCPC4KBETAFVRVSILJSP37TG0===="
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
