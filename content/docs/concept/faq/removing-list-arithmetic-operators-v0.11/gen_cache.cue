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
									removed:                 "Ez/8dPDT6vjz3Ph4xQMfVUAdvZmPXt8jik5/mLsippU="
									changes:                 "B/MapglNSm+Ga7E3EfEj/Tr4qWC/novCtULeWGn4/H0="
									"changes: updated file": "+sZYrGECcfFhISmjx1kZfz8/bPCztG7BWlKYj0Ad0mw="
									"references: broken":    "wzpUjRTqIJcR8lY+G8FVw42ghdX9QYiUt0k4e+h6BkE="
									"references: fixed":     "cO0+mTDGB1FwsgT6o/SINnn9GIq9diVw7z/qQ0CkBtI="
								}
								multi_step: {
									hash:       "9320EUN97G9F69V5LCEF5VR5OTK1VUJRTO8QDS1HFJCV7JUVSD6G===="
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
