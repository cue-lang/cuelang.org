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
									removed:                 "nYfSjyAPKo/aRXJi31YgVgwV7MVGwWN5DGtnhEdehAs="
									changes:                 "C5KobZHMC4ImMmZjJd6JMXlF71GLo35CTkZ8zNRUfII="
									"changes: updated file": "326+Czle7NKpaAPOwutl1IOCj6bfohiFWzKX6HsrrLw="
									"references: broken":    "cQ+/ucJeYB1agZG3+7Lubg3tSKzXSIJadVjida4MCrI="
									"references: fixed":     "pXjtM7KYGSiiNZPKIvVvcua4O2R2NHdDvth8Ul2PeFM="
								}
								multi_step: {
									hash:       "RBCH7P7K592DV8O57T1BGE7PG8VE2T61NJT7UU3LN2T3TFKSR2QG===="
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
