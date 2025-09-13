package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-login": {
						page: {
							cache: {
								multi_step: {
									hash:       "S98T10EDIQ1DDDGAKP62069VS8S29L27ML14KKTR8NH38L40GOH0===="
									scriptHash: "UMCRK5CAQ165D1O13N5POHNUP7FIUMG642LG0TSH76G33RV4BNRG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.1.0.20250913190050-8572198e1792:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help login"
										exitCode: 0
										output: """
												Log into a CUE registry via the OAuth 2.0 Device Authorization Grant.
												Without an argument, CUE_REGISTRY is used if it points to a single registry.

												Use the --token flag to provide a token generated via the web interface,
												removing the need for a human to interact with the OAuth device flow.

												Once the authorization is successful, a token is stored in a logins.json file
												inside $CUE_CONFIG_DIR; see 'cue help environment'.

												Usage:
												  cue login [registry] [flags]

												Flags:
												      --token string   provide an access token rather than starting the OAuth device flow

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
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
