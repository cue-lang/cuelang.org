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
									removed:                 "LVAgqVUuEdgpUt5CqKQrmaEuzhGYdAy1TZSPeknQQ8s="
									changes:                 "5ak3tA/6uT+C/1QXbyHk1R2toEK+/BMuubCfs4fFF+8="
									"changes: updated file": "IPzfM79VP96ec3pgDZvD5yy4wUkvZzz+ELc1SWQMduk="
									"references: broken":    "tw1OaSeGdS7ITNusDUyabZPvHk6WLY5Mt3yGnNG+xqA="
									"references: fixed":     "nlm8hIVkMIc0WvvBvAMTlSYSskauiA5tddTWQQBuCME="
								}
								multi_step: {
									hash:       "2CDO3K7BSPFN4LK9OLT3T79TLD2MB9D41OT884GQK7SLTGP4EOK0===="
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
