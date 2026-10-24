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
									removed:                 "fyxm9cMHtWm7eO0I0ba+3Hx++4mqhypmRhvZrPHRbXA="
									changes:                 "izFpXcow4M0SyAEEJRtd/qNA7nHXhrRhyq6qZF1UJ94="
									"changes: updated file": "8EvwLsLRCm0AqchT824TNpEX4ln64gAtLZ2g0b91QyI="
									"references: broken":    "tY2fCKc8NMEPt+IbNbUDGo9vAg+2R8EiBHRXT6lUInQ="
									"references: fixed":     "ealqIgr5JIhO3yWi9INTV4UvU3ngEADAdjTtLObSKDw="
								}
								multi_step: {
									hash:       "JKMP1RBBCEQRIC9T575SJA77R9DRNHCPLQ1APUV52TM88NIN0OR0===="
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
