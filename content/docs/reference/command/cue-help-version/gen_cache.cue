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
									hash:       "DBAK1CFBTD4L523RP07JLEVF7C502966Q80F1GVU1MQCQ1C3MT7G===="
									scriptHash: "0015JLNO5O5NCAQKUGKGC6RKU49H8795L47EBJDLM3O787PV3A6G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-alpha.1.0.20250704171720-206e82485fae:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
