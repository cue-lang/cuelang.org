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
									removed:                 "/j03JAbG/UoBShHfEa0KuwwVBrRVVbSYhG/DdV8YU2s="
									changes:                 "FAiruHvWMA2fyyuRFzSuq4WiOPTb8XfjKw+1MN6P7Y8="
									"changes: updated file": "UdoyfToV/8XUVg0HOWKF1QlYClSfRMTtkVtZ73SUD4o="
									"references: broken":    "UruSmfDJysiA9NWxcvpzPUNE3iuRMSixP3YQMGDqs2M="
									"references: fixed":     "CHLTl+DEGWhtdMQ/gWTMuZ6PQ154Urt/Q8X1YijFdtA="
								}
								multi_step: {
									hash:       "KO315AQ4BHD6QQGP461BT4O3NSD7IMTSM8SU8855P8O1AB621U60===="
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
