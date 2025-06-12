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
									removed:                 "l1WpReNYRNCr8JpokhbSaSddOh7EGAS9ACIjfQe5V/c="
									changes:                 "9j6hYMxLEhYVt/l8bd5by2Um6p+gTj9fUwDALEeceoE="
									"changes: updated file": "hTJMgt/Tbz04vNf/CgHCrI47cclGED0ElgJ9qLDUaYE="
									"references: broken":    "/2DxKJ7IkURGk9sT6xrce3QUXRdUZXJQUmlneNnOvq0="
									"references: fixed":     "bU02PT56oTqK5UDNLAPdCW9xxFGnWe58KmgJQPxXGfw="
								}
								multi_step: {
									hash:       "S4IT678IM8IG9HBF07C7A0QQKHMRBU9D96N554BSDSAENLA7HR6G===="
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
