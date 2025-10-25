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
									hash:       "TT35U7DS4E4B04R83A3OEMGGGLHSAUDUCMS8OPC6B6G2IENKSVK0===="
									scriptHash: "3R3VBT4UBHPH8K0G3IDJTDGJ64ST5I4TEVFB146FEBOL7D0TVSDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.3.0.20251025133102-654b5c06c385:$PATH"
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
