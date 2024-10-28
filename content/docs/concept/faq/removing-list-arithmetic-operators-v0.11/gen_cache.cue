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
									removed:                 "YKb9R8HkviKgsILJCQfuDww+FNJmGrcSb4ADqUv7T6w="
									changes:                 "f3Si/m03nz+AzyhIskS32GBupwDmJNdDB/vQwpaW1nU="
									"changes: updated file": "jcolj4NJ2lkHBE0fGKtj6cKfLlCBXIQrmHINKVcW7Po="
									"references: broken":    "hp0UJES2wNnQ6ycn7z4jVgFtqbHrdPS7DwLp5flV5vE="
									"references: fixed":     "DhcPrIebtAoUOY0HHsf1Pe3h9J4AQgGLiHlxPgJa7ms="
								}
								multi_step: {
									hash:       "C36D8PQLSVN50S32BUBG3MDIRIK4VUVAJQ1FGIHJ48F6NG6J1QGG===="
									scriptHash: "NGCRI8RKHPCF36EPH1A6M5DDJ4R1DBVII5KTH91E8SMG5MHHFN30===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.4:$PATH"
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
