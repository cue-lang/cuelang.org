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
									removed:                 "USWNTToUcTKGSVFeOud1rDbOUmsbVHHOzC3x+/p1IpU="
									changes:                 "Isv87ClanqLo56FniNIVfShFdN9bQZbQL2CNGakhtlw="
									"changes: updated file": "ii1hpxAkVwKkmlfNDKXOfPP6NeOr0wxDsaj5GJcsMk0="
									"references: broken":    "KbS8/npTxa98L9FgBBVYMn4JBBk6b2pTe+yfgLEU+U8="
									"references: fixed":     "K7F6yg9HxABjDTbGjQ/FD6i4jTXCR6i/BJjaz8tHV0g="
								}
								multi_step: {
									hash:       "CIP0EDDN5S40KOPT5STR93Q53DBTBKTEON4L3IK3EF9D8JBJSS70===="
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
