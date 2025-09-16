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
									removed:                 "yPzi2ZbLgdrWXXjfr3dpecdxPuWiZgS4EOmweHUbj3k="
									changes:                 "TAAKDMN+JyY2MbzQuuS5wmJuNSUwTmzlDPQ9vnhj29w="
									"changes: updated file": "enenKuFC+hDirZXALtaCU3MdvQzA2E3ds887wuHM04I="
									"references: broken":    "rKAz0mrj1WbomQLBd7h7efx0LxkZMMUE/XYEJawX6/E="
									"references: fixed":     "0o+J0wtw6Gf/+nZu7sJxU86SO0Cx3m82UdupvACOv20="
								}
								multi_step: {
									hash:       "2APPUCDC620ULOSMS51RVC7IQCEPSUF73587CIKQ84HBCBRDRQLG===="
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
