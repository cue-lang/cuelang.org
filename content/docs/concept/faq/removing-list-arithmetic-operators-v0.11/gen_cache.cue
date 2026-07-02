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
									removed:                 "Wg7HA32CtIK/4vBM7GZJsb2mz/Dp3bsEEzSI5YdebEA="
									changes:                 "5uEBkWhEawBXtvKkhKOpQxHJTDcjjD6q7/oAWWXiYhE="
									"changes: updated file": "CsK8TsPnfLXNE0a5CW36Ec7OiAnV5tme1dLrCxuFBuY="
									"references: broken":    "iS0LAgqcLjT75Nl5/tbPIIx3IqvdWGwtsD92ybPD+5s="
									"references: fixed":     "Z1kCV9EiwAAYnfPRWjcIrg2VDAZDhaIR4bN5awWbd00="
								}
								multi_step: {
									hash:       "HTOU6L4O8E43O41IJOT62JF86JOH9B2O2PTLKKLPM383FMJ3OV30===="
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
