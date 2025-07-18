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
									removed:                 "VopHqn9Q6gTQ4wWqnJXr01KRiNOfV757Rj/VblLbYP8="
									changes:                 "jsfBKdc/oTr9+izW05rpoWCXNnPldGnHUePnjZKMhiw="
									"changes: updated file": "uJoVDvcryRw1ZfW+77rjnpKIhoTXFrZPlg/6loZOySQ="
									"references: broken":    "aAkvQIXnJrzIxzxpiLa58trvaC3JHsuUFvcp5fhu6io="
									"references: fixed":     "fx5gS6rI9sCbGgTtgi6JAc8v8G7hPBavz7buFeRQd4c="
								}
								multi_step: {
									hash:       "G9C58LV1H4T3O2IA1EOQ6L7BLOIJJD3IRC5K3F5EUDG621VHEPNG===="
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
