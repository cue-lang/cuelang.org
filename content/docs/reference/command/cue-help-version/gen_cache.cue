package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-version": {
						page: {
							cache: {
								multi_step: {
									hash:       "N8LSBE0BA760T3J1VS59JKHBEHMIVM2TRHO1J95GJNNFJHTQ06NG===="
									scriptHash: "2Q3JMTEJFPJUN9A3L05OK60GFUH4SS2EHHIS5ULKD19H8UHPQHB0===="
									steps: [{
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print CUE version

												Usage:
												  cue version [flags]

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
