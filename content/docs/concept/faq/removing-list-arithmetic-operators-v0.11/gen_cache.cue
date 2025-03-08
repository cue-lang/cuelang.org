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
									removed:                 "cS0GRq1b1zKwu+J/it+z21tKT/g0SsyAOoDQAOYgtr8="
									changes:                 "hR6VU16GSEYqHnigwqTUhGbob9YCVBiZ3EhTZWGZgac="
									"changes: updated file": "lB3hRc6D9qPk63bn0zeSkSIY1ySMofwIuDf8o1WWfKY="
									"references: broken":    "sClts4gQ8K+v9bJsfzfHHK+fNXa+NI2CPUl/qq9RAJw="
									"references: fixed":     "4b8YbYJ/fwxOPsyJAC7Rz/oq9lZVs8kSjtfLXSTtQHo="
								}
								multi_step: {
									hash:       "B7LC5ODAS0H0IUCFIFFLNNAG3O60ISL1AII8JN33PA64475NOEN0===="
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
