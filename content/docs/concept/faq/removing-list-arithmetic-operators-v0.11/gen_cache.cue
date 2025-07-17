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
									removed:                 "RA9nko6hlT3f906w1eMrphVMC106/0R8P88Hx3AenJA="
									changes:                 "Xj0xYOEK3jro5kN9PwecGIYY6Inbqk2fDN6OV7eUuRI="
									"changes: updated file": "u8Jr6uU2+0Lig5n6RUNfzU+PxW0RdK2ACg2mE4iFEJQ="
									"references: broken":    "f5jg3iFykr6eNTKkh+npGXWj2r2xulMedIqVrV4NWLw="
									"references: fixed":     "CkbpPUZeOzVjMQHBlFrizMXgi6MrcDZfQy3MaoA0Rp4="
								}
								multi_step: {
									hash:       "Q5033PN3ELH54SEPE485UV4SG00L07C050DJP3V9RRBE92FIONJ0===="
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
