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
									removed:                 "vAoJKLQ/EnHy8BvcQAl6ya4+anZ8AR5u3FbTsgWQqJA="
									changes:                 "WTYovVAZajvkz84VyI7hPI2opkvfwLgcW7ycRDYgNik="
									"changes: updated file": "kb8vlVHcJhoSsSjNmT5JG5ScpQY6t3adHRW5GIMv5oQ="
									"references: broken":    "vpDW3wQdxftFySLOP+tb2wDEGv0lN8pkvTK9iy8dILk="
									"references: fixed":     "RGQLWs4u5H30yw3ygTZ0E8xcsPHeEEWvyxXNAcuMbeY="
								}
								multi_step: {
									hash:       "6BR19L80P9IG0TQK7VM7BFK4N5TPMP8C9SO4UVQ5UKJJJD4NL73G===="
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
