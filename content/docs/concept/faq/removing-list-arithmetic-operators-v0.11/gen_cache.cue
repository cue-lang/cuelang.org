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
									removed:                 "beGWwefn5zv78SnJ+n+eaGpB8dGwBbI4qIOpdqgBGvE="
									changes:                 "1Px96FOTlkIqq4bKbWq0a8nZSrJustDMWZPfG+X2v+Q="
									"changes: updated file": "POLPpThuTXF0aCL0iqBz1g6uEa2s2TJIIjIQi7pqx5w="
									"references: broken":    "JGNxfihYzsx6niRCcrn4QraNoJT8k+yXd4pKnJZRtRk="
									"references: fixed":     "G6+HEafxBqmH1aiEvzDBMXmmt9t8pM7tfCywZdCDfnk="
								}
								multi_step: {
									hash:       "50RL99N4I8A63S9HQC3F5PNLKR5HMT27UNUO5FCPD052BF0INBD0===="
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
