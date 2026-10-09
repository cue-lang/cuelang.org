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
									removed:                 "B9IHHOF7EyFgfZa/hy/pGPE/u96U87+MMlHJADSdqWg="
									changes:                 "VR5Qo5yYisteV0I3HsnseTD5yq6PZ+JfkMeTLQxIkjs="
									"changes: updated file": "fPFPsUSTG+4i+xSmk5fIun7EJrLGNiFqCUpos0/BwXM="
									"references: broken":    "5aof43lSYqzKwoTOlw6ScOk07X7B+MNTTqoih3wIOfs="
									"references: fixed":     "iT/sf+2bnTa5V6wz288+4RUdpDsCYHOBShJpfRazHB0="
								}
								multi_step: {
									hash:       "N7PNU2U8IC4S12B8017HKAM4SNBF1G4LMLC2800EFQ481B53C7FG===="
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
