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
									removed:                 "5utYVRqi2F6QAqw0Xium4BchErHWhEfXtFl9RMPOf38="
									changes:                 "JQBYgDXqnMXIzMO/g9VcPlF2rEUWsSS6keK/GggSNSY="
									"changes: updated file": "FJbgNTx7RVWSWFkpm181oWj2lA4ySfdyxlrJXzAZVmk="
									"references: broken":    "bLSNK6v159ofHzHFXIPHY9o0MBuQSPvgAtoYgzu+qjQ="
									"references: fixed":     "27jG6LMo24AxeKJUd9uQYh8qmKL/Afet4/JldDIN4xg="
								}
								multi_step: {
									hash:       "VHF12DOLESQHREL85070UB4LCAJ62GL8O08NT7IGIFFE3M3QV360===="
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
