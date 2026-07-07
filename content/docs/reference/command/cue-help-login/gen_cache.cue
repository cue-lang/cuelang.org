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
									hash:       "DQTUJINES71KIC1GF8UMIBP7ALD3QRNQOL1Q57BAVMEUOTMUIVE0===="
									scriptHash: "MBAT760EK319ID44GCKLD9U09R5T96ENQAERMQ1Q2CS9RPGSRL60===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.17.0:$PATH"
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

												To log into other OCI registries, use 'docker login' or 'podman login'.
												The cue tool supports credentials configured via these tools:

												\thttps://cuelang.org/docs/reference/modules/#authorization

												Usage:
												  cue login [registry] [flags]

												Flags:
												      --token string   provide an access token rather than starting the OAuth device flow

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
