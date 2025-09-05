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
									removed:                 "qI+G4Wg3siQlzIvbBSgshsq9yubZ8dfQzvEMZ70T72A="
									changes:                 "UvSPg6+wp8oaQo6ZpCtPBV0Cp5e00pcMzfawkrmEoWQ="
									"changes: updated file": "mONuyPAgBT47rQds4RDkpOaDryS8r3cFB9gg2kJ3ELY="
									"references: broken":    "e8VzmOCZ/UCLmU8/ocWNNgPwbohuxXOPo45FLc4Ev2M="
									"references: fixed":     "2u+LXpD1VKa0Y3jWZA1EF2bLXVjLgNOcJPwwHykNNXc="
								}
								multi_step: {
									hash:       "AL4PBKVGIITVA12O2HRQP8PQE44Q8CGP5LH5KVKV9SQTPGP79TEG===="
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
