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
									removed:                 "Cg7TExi0/lPZTVT3ZW2/Z/Efc8vbtu5xh6UK8kSPIDU="
									changes:                 "wNfCOboo/6EHy1GDFFJnC5Ej7JcpMLuJidTubHcivUQ="
									"changes: updated file": "0Ro5AmtueTrp8o7kwfCpsz7iVlb7oB2yNF2wFqFznW4="
									"references: broken":    "ZQnbwCI+Ti10XKD6E45pwijSx0y2ElrU0zGkiWKrUDE="
									"references: fixed":     "ZozhZKFakYVoerJNHsksvK3Vc5KTyh1b129yablmClI="
								}
								multi_step: {
									hash:       "N7IREOHQGL944SJBJBAJI35DLV2BKKQ4I2UAG4M4VCMOFFF1E99G===="
									scriptHash: "E7I0926EB2FHGKQ4NU1U0297MLTS3N4R2MVPLDVCPPVKFD86DBFG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.1:$PATH"
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
