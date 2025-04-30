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
									removed:                 "LIhHRGgivAtnudrXuJI5GEXxuD/h18EICufslXnKxLY="
									changes:                 "+fKcOfy/jSMKhSrQU/jU0VeuaszpeUN4FtSBLiOnB9g="
									"changes: updated file": "FZ2kwbJR77CD1T6w34y7gAkihgDacwdPaM8FEsmP8hE="
									"references: broken":    "TuwXIsa0FI3WZOWlXszC+0HZGDvyD1w3fDc/ru7n0qU="
									"references: fixed":     "yru3AXCxxnUND6YSSYUcmeREKtxD8wIhg58x2zINOK8="
								}
								multi_step: {
									hash:       "4JH06NFSJH9DT2P78V8M54BJ3G7QGJISVFCKORU0E82GJL7O8AJG===="
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
