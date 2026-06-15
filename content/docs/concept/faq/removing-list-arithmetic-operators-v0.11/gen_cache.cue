package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "YvKef3rdk/eNkIi89S4Oy2baLo/wIWIfauniLdf0dNY="
									changes:                 "Gzrp2RlrMavd8kOcrKBO67pUWj1OAVgiLeiXGXw27eY="
									"changes: updated file": "Jxc42rEKCCWw9SAiRkNA6aGahMmsFA4wN+8LTCtdVvU="
									"references: broken":    "red4a7hQWcpk+tBqfUi4ZC5ue43UAUZDLPGVpGYDKOY="
									"references: fixed":     "xj9I8xhcDrPIkhmTcpNWc3Sjv6s3T4S7twa/RIhg2Z4="
								}
								multi_step: {
									hash:       "0GMHES33L8ESAQOKCCKHB7J88BKM2QHUI7OB64BBK9BDPNV1EA20===="
									scriptHash: "CQLN0JB91J0J500G73ET7JLAEUQ73QC37IB3PEFB4O462O83DV2G===="
									steps: [{
										doc:      ""
										cmd:      "cue vet -c list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c references.cue"
										exitCode: 0
										output:   ""
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
