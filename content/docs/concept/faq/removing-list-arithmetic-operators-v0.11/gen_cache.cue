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
									removed:                 "cL6sjrN+IvGhiC0flVEtgIZo7l1GBnsHPnaOzzSVE6M="
									changes:                 "nhe4HjuYu24jG8097QrxZuZfyTZyuTQ5eK9npBso7EM="
									"changes: updated file": "bOg/lF/nr0EtB5CVemMWJUvT/r+3t1jMEcRHnD9JjB0="
									"references: broken":    "YEhhZvLPdGPmwsuuCCS17bRqepmQQd+84AD25AaIUJo="
									"references: fixed":     "WgfAGIqRkXxfTJIYhAe2gYA68xs5WmckbBZ5Y/YMnUA="
								}
								multi_step: {
									hash:       "JPOS3M0OQQPM98B6DBTFEPFC02V94T3554U3LAENOU1PJS8CG460===="
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
