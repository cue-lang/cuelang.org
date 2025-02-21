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
									removed:                 "rr1DOBxF19+ZCiDc93dgI8gRZwqJe55FzAgiKfw9zuQ="
									changes:                 "+hLExsmOiYrIS7JftRQT2MeHMO/Zunh6R8pD8JY4000="
									"changes: updated file": "+q4IWJQ7VLDbY+9BIaayK3GHbYgtwCmFxyi74fs81r4="
									"references: broken":    "+GvK/oAwNA26ptAWfNuj2wqOexeZb7kM8XpJeiYBBZ4="
									"references: fixed":     "FBYWILZPdSyhAWxYfGP3DlPEfUUqROKo8BCVwDRYX1c="
								}
								multi_step: {
									hash:       "ULSH33G72ATCTNVV4EQ15U1IBB716OTGEU2CIN5NPHVI6K5CS1N0===="
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
