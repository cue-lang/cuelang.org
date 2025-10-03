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
									removed:                 "k3u4k05+4Q8JZVtyPfdZeYY6O6LjVJ1dZQgNXKdSrCM="
									changes:                 "7yphh/AKcg7DERyKLH8iXIv+PoQG2t0EOykF9Z//bqU="
									"changes: updated file": "dq8w2FDf/gCe03O7AYEd6qw8y5TdZqX6HndSjFuu9R0="
									"references: broken":    "W/nF5vZNn0Ra5psCblPr7slw4fk/QHesFRHmHEwzuRk="
									"references: fixed":     "gNkbbZxBqdtDzF09497WuKwUBCAK+Ic9ptZ9tUzVBy8="
								}
								multi_step: {
									hash:       "45KAA2QK1DQ7O9NNOUOMCRRJ7OH8HLA9UB0FPDITHF8BTALNVK8G===="
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
