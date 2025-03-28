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
									removed:                 "pmmbdSGTP4kiHXwtgLkNlR3lDC60InrbKmhNBmSAxFY="
									changes:                 "RBW+gfWUnBaaEzlR0A/XOc9y3UHRHM2wFYKWiVDK+Y0="
									"changes: updated file": "QjRVQHxL6NhUUz/rXYbSEUL9dQyI4CSyXikRSABK820="
									"references: broken":    "P2TbCjwmJcmA6Yjz1cQq66h8XQ+Dzx/ZlP3ZZh2dTGs="
									"references: fixed":     "Drob6tNadBEDbCjJD2tDNJ9T+GUg1cVHpKUKx3WEDDM="
								}
								multi_step: {
									hash:       "3LDOHB9PVRQHKC9USLBNR32DUP427DA99M33IRRGTEL40N3BE2RG===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
