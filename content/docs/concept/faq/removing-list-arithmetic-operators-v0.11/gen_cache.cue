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
									removed:                 "yvolJQwKk3Unu5KRZXzOXflhOdGWXveaagwGhad5z1I="
									changes:                 "Uh5Q5fub8dWqkUu2qclRhmJUqSI0mqabw/vCLS81dKw="
									"changes: updated file": "xnFZulElsjBJjqXCfm41x3MqSP4QuXak8gx630xxVko="
									"references: broken":    "jNhuL9xF36r0cSBfRuO5hyAIpsUbpeNiesMABmSsi6M="
									"references: fixed":     "I30sbDulJR6+p9NBnlw/ukLLfYNHIxIMAf40OqjS4uk="
								}
								multi_step: {
									hash:       "4H2R2KBFRIFVDR7LVCM204H13V4D2660C9FDR5GTSSFS1VMHKPL0===="
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
