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
									removed:                 "Zhxoxav6b3xx4TYRjSd5EL+PmQ6JXd679zJnUOyroXk="
									changes:                 "8NRun/b0qmHNh2PYv3/aBadkduwpLKx0vdG25SWDuwo="
									"changes: updated file": "hUzAX4OpL3EGk73wWwikCQGN1cUVlBriQHsJvOkO69Y="
									"references: broken":    "rERHZCWRDY71l4gEAFJw/5iUZwdjJqmLuCDBrXx266k="
									"references: fixed":     "HpxpyRnOBGMH+2SAuSmf90FuC/Rcg6gCZOgGmKrIJxE="
								}
								multi_step: {
									hash:       "57N67TURQ6L4HCFGQ059BGSD5V3K2E1M7NAQKIVQTH426PVMSN30===="
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
