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
									removed:                 "SPC3o0a0hFWglaUL/E5zXfJv+8p/a+ILkKIP0H/DTlE="
									changes:                 "C5YpeXa+gCMfsIra9sLwhg/SJo7cIoYQiY7PtVodbr8="
									"changes: updated file": "ALiDXXp36yb0IjcoDjEu8P4R0RmIvWqf567jBwBLNf8="
									"references: broken":    "aqFkH3PwQFYIGTKsc0fm2Pngob1yjFCyAyq4hITVcAM="
									"references: fixed":     "h0+RAxH0v/uS8XGBbzASy1k9h6X66O9IchdPuJWfEeM="
								}
								multi_step: {
									hash:       "CUL5UBIKDU3A8MMGHENJ1347216DVB6SK6N06I416U8T5LFGSB2G===="
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
