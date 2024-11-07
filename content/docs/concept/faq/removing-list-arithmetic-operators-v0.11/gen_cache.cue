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
									removed:                 "NDHbCNtaVA+rDG3yejc9qIbiTwPt34bOJARtBwwN+Pk="
									changes:                 "Ek+u0ghNsyNEkFxwsFD6zC82U13XAIwVxxoscyGDt9s="
									"changes: updated file": "xXutwr4KA5bI8RC2+WGKSB3IPp4hGXVi/z+KRw8EQQM="
									"references: broken":    "msqepvj9pLGWWyT9DkuYF0sMLIAmqZ7FcnjqO+ZXIR4="
									"references: fixed":     "m6Amf0UKVBUzpW4uscu6qevNCH97/qN9jxVuM3Dt2HY="
								}
								multi_step: {
									hash:       "13V4BNPJ35QHQNS530IGSG8B2FD0CEOH2CINQ7AJAPAKQRL7RTJ0===="
									scriptHash: "NH43UHAVPJJ6HLG0BN15H409KTJU5NDFEOLMGM7OT1B15H4CUTA0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.5:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
