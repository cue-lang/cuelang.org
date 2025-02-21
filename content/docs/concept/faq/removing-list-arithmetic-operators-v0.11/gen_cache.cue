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
									removed:                 "YbEPGvJD/QGk1SkUaP0X5WjEaDDyAnkEtkBox+qOQx8="
									changes:                 "EXiCAjZzj5lD9wRRMrRv9DudP81yLmmEjW+JmnisY04="
									"changes: updated file": "NUxYoZPDWEyDou3EXHVMsj4d8kePiXFCsr/7MpkJuMw="
									"references: broken":    "4to3bHfNuAbq8Uc95MZU5I9/SoegIpVGi2XhQTo5fIM="
									"references: fixed":     "Uv5T+4rfbJHaBHolrtTP30qs+X/9YmB4QxPRCWoE9Xs="
								}
								multi_step: {
									hash:       "A53B0QAIV6JIVNF29UEHN5J99390U4AS8IA7HU70615TMN0M11P0===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
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
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
