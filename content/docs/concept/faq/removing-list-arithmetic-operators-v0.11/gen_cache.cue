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
									removed:                 "IhUYGa7rQAs83iUmzF9/arV87U6MV37Z/gvQWtYKWRc="
									changes:                 "teJ47p4zZbKD1jPLnGEMYIAYhDwqSKPFPNloksZuXPw="
									"changes: updated file": "Zm5hDjy0ToJkWF58DTlj2Rr0hz9RdEQqCzoQcLFsBOE="
									"references: broken":    "thXBfBkC132wbmulRqryTRj7k4N/SYpFJeAvobs3lmM="
									"references: fixed":     "gZCuJezx3K9j++vBTOHhL/XXPMgztldqrc8IVT6arYg="
								}
								multi_step: {
									hash:       "J2QBT60NVR6D5AM2K53P5GEVNLRHSOOMQQ4ROO27QF3QK90R5SVG===="
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
