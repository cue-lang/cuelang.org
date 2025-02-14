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
								"example 2":          "8SUiDeoln5uUQF8DztQflk2s/3CMA6HYDm5yBodefas="
								"cue_types_gen.go 2": "yZpufCeIac9DB8ZEsDYCUGtD0uH1pibzeXQYRv2uw3o="
							}
							multi_step: {
								hash:       "N4ILQREO0H45704D24DBGGOKPTPG78JFGHV5PPINGP0M92JJUBE0===="
								scriptHash: "BU5I2RBF618MB7OEV6QIAH363A2DNUVA4TF8F31QMBGOUBO3Q610===="
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
								}]
							}
						}
					}
				}
			}
		}
	}
}
