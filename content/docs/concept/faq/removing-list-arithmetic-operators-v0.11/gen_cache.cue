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
									removed:                 "ckmVrlWnW7Acf2d6db/CyK8UoJnQfZc+p4HfR6qKD7s="
									changes:                 "YtBFzTpQN7g7nuHar665L9K8BbVMWfuDW61M+pccJOI="
									"changes: updated file": "nNsBDb6HGLGvd7HhqNQiWueDGPUlo6+/sBImwnLjBLA="
									"references: broken":    "TEkwPAKRUr54v/F3B0g9OydU1x8rFumgClyJ7cbGP78="
									"references: fixed":     "CLddJUiTwEmdKp/BSPOXgZ3L5Q4TH64ee50+AYZL3PA="
								}
								multi_step: {
									hash:       "7M2C4D8GHUQC11SBC7R9NR8IO2HNTR82U4VA5099SP9949E2BIKG===="
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
