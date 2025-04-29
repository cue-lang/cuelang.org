package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "TAucayDTSuBBjBbLMctXLGhpS9vRviGvb2vH7H4uVnc="
								"cue_types_gen.go 1": "4/LlyWyvU8YWNc8C3fixh/yAtlOPXpHCd40ogU5CRTo="
								"example 2":          "FS181Gbp2kFVUMA3CYxlvfpO3dDHoffvEDbq+7bG2lg="
								"cue_types_gen.go 2": "Ifpzn3jmY86xKWrwENcsnF2UhrRNbPhm0jBG695RLYo="
							}
							multi_step: {
								hash:       "6FK4KE6LIABB9UT88H170PEU5EEQ2C4DU4GO1MH915S0QH4BGNK0===="
								scriptHash: "Q16KFNBK24VG60U3RREJDA0S1GLBC4I4LRHQCTFGCM65QEV84ATG===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u cue_types_gen.go cue_types_gen.go.got"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
