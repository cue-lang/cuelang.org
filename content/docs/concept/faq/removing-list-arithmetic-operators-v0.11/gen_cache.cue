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
									removed:                 "xqD2YEo7a0yYdfhjwWg9PWSHyDcjoKLxLa6J3epJz3w="
									changes:                 "mkxfJuTm0ac9kDZ6nK0aPOKzE6FTjpDNOTNbA8KaeKg="
									"changes: updated file": "WQHb1FHsKM89UGTooVymO4B7M0GOSrQcVM+g0MuNxBY="
									"references: broken":    "fsedn9oTAGpB5ohnN5jlK+89R/A8mGrfg/WVsRyZrHA="
									"references: fixed":     "L3DD6a6XOHoXBPx8uUbdSPqeGs1K6ULDwZGQbYlT/Kk="
								}
								multi_step: {
									hash:       "N87NJQVMR4TBKFPQB0FMG5S98FQ95NTBAGOH2QSKB4RUA8HHNV20===="
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
