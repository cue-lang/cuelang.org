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
									removed:                 "lylcPCdzp2qTYDiYsMRnIGqlU/0zPxlZHz9EmRZ0oS8="
									changes:                 "nX/1fuqM0aTNvrrzOAKbr/33+6MSwUbtS8r5n4t29n4="
									"changes: updated file": "kz79vmxufZbFIlVIlz06Tqj3hrd0xienOd2u6bxmGRg="
									"references: broken":    "qCy97lcRNTV28zaH1EEWjCzD4SMcyGQ78YskZP+DC+w="
									"references: fixed":     "fGwnjgc+sqIQExpHERAZ2cgR/UBrTO6dulb6xLndcV8="
								}
								multi_step: {
									hash:       "LO0N670D657VVB6O7R00V9E3AGOG5HON7AC5QP5CD3014ILKA900===="
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
