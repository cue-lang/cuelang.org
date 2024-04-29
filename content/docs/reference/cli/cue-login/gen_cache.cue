package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-login": {
						page: {
							cache: {
								multi_step: {
									hash:       "T7PDDQSCMESJ5TN2G2388CCEBQ6OUVMVCVP7B9Q6B98N0NGPCQDG===="
									scriptHash: "85L11RS7L9NBVG8U5ROM3H8E7LOB5TAL6MPUJPK8SQ9N584L8D8G===="
									steps: [{
										doc:      ""
										cmd:      "cue help login"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												Log into a CUE registry via the OAuth 2.0 Device Authorization Grant.
												Without an argument, CUE_REGISTRY is used if it points to a single registry.

												Once the authorization is successful, a token is stored in a logins.json file
												inside $CUE_CONFIG_DIR; see 'cue help environment'.

												Usage:
												  cue login [registry] [flags]

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
