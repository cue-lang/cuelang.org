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
									removed:                 "7/3RLxVgHmQgfGkADDUKLzZkVNRHVuouf3xsFY+Tpdo="
									changes:                 "Ss2zABMHyVmrWIrpbLrMKlHHaGa/PBlSHTX9CsZ4Ab8="
									"changes: updated file": "ms+rAbMUOAJgU/fnLOg/fh7DLcjFXEyWLJesw+ogcx4="
									"references: broken":    "2LudmB2Zv35O5CchWfvjCaSsm3nbr5eG6zWPvlCuFNU="
									"references: fixed":     "HRreq6K0rfLS21Cem6sfjn3fSqU52XcceLsI2SdWX84="
								}
								multi_step: {
									hash:       "BE4QT3QNNDU3HA6SR14PJ4QRNOS84CEVPFK791CNO308VISQ2EIG===="
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
