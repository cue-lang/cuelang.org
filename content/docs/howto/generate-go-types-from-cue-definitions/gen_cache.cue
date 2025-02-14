package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "lYUPPr4D/vmRljVAOgNV7VxprmMGmLDcXfsCgzlkTQg="
								"cue_types_gen.go 1": "aiAWQOZ4Epk4/dzIyqqL2TfqfaEcNQba4610OPksVvA="
								"example 2":          "eG493PyOLm3rX/vOPu6PLJWM1JWJC5Ds2Uxk/ODqa70="
								"cue_types_gen.go 2": "yZpufCeIac9DB8ZEsDYCUGtD0uH1pibzeXQYRv2uw3o="
							}
							multi_step: {
								hash:       "L27L076A8V1OEQO89QAE5DVL5V1E553MTTQAOGP9DMDPQA6NUE40===="
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
