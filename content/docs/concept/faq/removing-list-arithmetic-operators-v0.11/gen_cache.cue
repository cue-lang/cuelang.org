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
									removed:                 "xr2GagZQ3ZYtM9UU44EcTdHQ5bh6Ysceio4JNsdbVho="
									changes:                 "SuUrMegMQQJ7LGA4TP/vx2dJGrpgcs/FFZ0El4DrSps="
									"changes: updated file": "X2+I7G8ZahcOLWSeoOYJ3GfJiVOpr4HcZWNhY2SNMIA="
									"references: broken":    "BqqMwEIv3ihBi+yAk4+4rv0gDekfaumxr88bzqGSkzk="
									"references: fixed":     "Cf+6xXg61BCg9lkNNZbGqay7a1G9Z+0eVsq9xMX0YPs="
								}
								multi_step: {
									hash:       "DI272PALBJ2S6985A9NCFDC7IIO9285EUHO8LO0A4AMA3VJ92AAG===="
									scriptHash: "SBEFDKT04I04B6RCD2P46K2LSE31D1LS9EPISLM626C7D6BAQG20===="
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
