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
									removed:                 "In+ZK6k37PIQ7kqCCPk6yYDAfFHUMEOg5vBK1KXLVdM="
									changes:                 "HxY1UsokLrtWcw7tJ35ppSXaVri2uATydQaO9Wzh+RM="
									"changes: updated file": "mJKbJKOaudeXV4qlB4+rlvpSSnKxMy6qw7k3IrNcQrw="
									"references: broken":    "I85pzrlUqxcoCyJ4/dsJ0+UlX9kz0l6xDSy3eHFmT3Y="
									"references: fixed":     "WzKALWNwjLJ9fanlVCelEgEG0okTsUC4FYB0QYqSrQc="
								}
								multi_step: {
									hash:       "3CPM5GNSL9TVKFPG4R63OH02OQH2D6MF924808JNTU7P7JEQC040===="
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
