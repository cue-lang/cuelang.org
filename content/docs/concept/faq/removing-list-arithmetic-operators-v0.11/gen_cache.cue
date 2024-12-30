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
									hash:       "NNP1L7SP3M6S3MG4AG40LPQ1JHT3A5175P9KADGHL1B5SPKR1NVG===="
									scriptHash: "VLNGG98FUABM36HDGI2AH2IQCN9I2OP2RSHEFN8T9SKDP3F1HRP0===="
									steps: [{
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
