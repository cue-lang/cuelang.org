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
									hash:       "H86CLGF3V3VA7AEHOBHF0L0E6T1RP1PJO946NM5593CESVB3FRLG===="
									scriptHash: "CEN7JMK972JN7TN3IEKN0UBDFA0LRKG61L00UDV8UDO63A7KE5A0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
