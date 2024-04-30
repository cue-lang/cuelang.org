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
									hash:       "5UA700QEG31N08MP99GVBRG1E1CR7E18517NH99DQNLG8KTI1KTG===="
									scriptHash: "UUMU3963QV0EA3QGARRGME9OJ9JDK04S8FTB8D1ORKT9C8DO1IT0===="
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
