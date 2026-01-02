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
									removed:                 "gud7mahZLwuLtYm/4dT/XbNykTm1pfqxtKc+dcw9yM0="
									changes:                 "h6m1sRiQvQLsvruPzBFiDeMZZdge6ljACfdukcuqb8I="
									"changes: updated file": "ydlMmk7qu3dWfq4btuaqk/W7KsfQrMPHmI2RryuNxVU="
									"references: broken":    "CSECco2kZaq1fCffneIBo5mqiEzEOvHz3Z3V03LwrP8="
									"references: fixed":     "hkbljEaiLOiRM3FoGRJ4HF4eKP0cYxmC45r1RhHBIb4="
								}
								multi_step: {
									hash:       "MCEQDV3U4M36HJ21O7R07Q23J1ES16LMJRTE6915H5VC5PEI1S40===="
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
