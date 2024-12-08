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
									removed:                 "bDrwWGRGyIfAqRwXyNdj5nxl0gSzIrLT3vNqFuHoat0="
									changes:                 "o/YhGB9270TVB6RDbT3GvNTgN9IhQ0y0jXIdMAD/Jg0="
									"changes: updated file": "Z2sH4XmrKi6masL5JAVmQjABc4btm8TdYsLvNSBFWY0="
									"references: broken":    "yJ42pQFDHuRbD0jHSks8EbEGOwWnbzrVEeSDybAlsLM="
									"references: fixed":     "/ye/b7PAWPddZIDsEYqvZwt8AjVvBKf+E7dDuGa0LGc="
								}
								multi_step: {
									hash:       "NHHOS4IS1PCKV2CC4094DG8PKO7E44U5TO54KJBBSHQU3IAFBVAG===="
									scriptHash: "RULQ2M7DNVJFRFHVTTQF9629RFIKEA09A01OD2LV8AQU7GH5BK90===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241208100708-432c1141e6e7:$PATH"
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
