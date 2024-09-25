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
									removed:                 "fuP0Kb/U11ZzS3iYLaem/cQ3s777E58g6TX+LxE/Kpw="
									changes:                 "J65OioSgJKEbgMMRCBMsm8CSrbgwKIJI3L56WpbdOTU="
									"changes: updated file": "vy6zomJaKOSZkMet/zWrR/GS2gWdrTaXdnFbMa8bl8U="
									"references: broken":    "v1/mTNJs1rAkakm8L6LBAbOJvr8gNGGo9PHglUlW8AU="
									"references: fixed":     "HhPJAN7ew8eqABQmNf2t70heqVcab+G/78yxNZ8w0Dw="
								}
								multi_step: {
									hash:       "IK7OPJ4RFSVCH42Q0EM02HQ1F1RMNUSRBPPMDMEIVB2FT2OMF0KG===="
									scriptHash: "V2S10R51KR54V7N8VMN82O9JNFUGUNID1D805LVLG2V27N98K5SG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
