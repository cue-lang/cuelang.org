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
									removed:                 "MOtWDwl7FlZGpw6ZrJs7iPUo1nTk1LqSUeI4N8jwCHE="
									changes:                 "vEWKRR/vE5/AafbepjO8IvVrXbsy52r9gQ1MIvf05iQ="
									"changes: updated file": "6Jv7rlfuTeaV2vRY/axwJk23fvPVriy2k9EySmrYlJU="
									"references: broken":    "h+VbOvBThfM3cg6tz4p9hkf828wTyAIoa6fJyFDocmM="
									"references: fixed":     "c8/M02Oy9z5zfDDPisP6lrPUWPElAQcoBAZRoU0lVDE="
								}
								multi_step: {
									hash:       "O51EQ4TLF72FC2PSF7EE353U3SRTB10IF2FNNTHVLLFJFJR3TSO0===="
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
