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
									hash:       "KCJIH7M6AJDC1MN600TQCV7B82P68CGIJ8L29CN275DLJ18GHP80===="
									scriptHash: "20KQ7JHAES0OPMMC0LG2KD11S8B4PP5C5RD3GSU6J8GTOQ9JK9RG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-rc.1.0.20251031142455-4ba957271db1:$PATH"
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
