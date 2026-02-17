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
									removed:                 "3+T5NgIh0NroxZx6UeJ8F392C0czx/yYUcuvfTseDZI="
									changes:                 "4wFEruPgv70zplAGuPAPjaHYF1HwvHaKcKPSwq23xYw="
									"changes: updated file": "SQer1SalJyVokVYOspVmKBrvtp+2HcXWemz97VYIF1I="
									"references: broken":    "2xRxrJF/rgrLQ2qxT0L2PT5ihOjju/0E5UdOOt9n+nw="
									"references: fixed":     "Nnyh1SvO4DLOSM0KsAuGka7l8KR7aCWyNWajFThix2A="
								}
								multi_step: {
									hash:       "JIJEV101I4VBT5BSHI9EFCTJ75G3GMA6MQB7HDNOEC637Q1C2EOG===="
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
