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
									hash:       "VH6ISB3LRLJ8VHPA602NEP63EFHNCI24AK1NB04F4UBPM3BAR6G0===="
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
