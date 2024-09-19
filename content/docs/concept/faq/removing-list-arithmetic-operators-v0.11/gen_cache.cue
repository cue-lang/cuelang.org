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
									removed:                 "S/13Axl2gZ2kECentw9BgzmaxanQBVCjo7taEgSS+Ak="
									changes:                 "3/etM9SFVOTqGbZ2v4MvfWlGRONL2l+ywZb7a349ni8="
									"changes: updated file": "Jz9IkY6/qtMJeIuWLfBUL9SRo3/aQmZHSs7hEqVQsjM="
									"references: broken":    "/n8VINyA7L+T1kNSmWlYZBHp0GnPBbV/3b94maz+o2s="
									"references: fixed":     "LM9gcHs1M6ZWzMFdUdokHtinQ9yFWpVKalvPlimMW8Y="
								}
								multi_step: {
									hash:       "EVUQNC11QTAGH7B2CL740NKC14Q8SFLJ58LLO3BFEKSMVMOM72HG===="
									scriptHash: "SG968CL2ID2LKMV9L2G9187V5QJAHTMHFHA80T860N0LRTOHIJDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
