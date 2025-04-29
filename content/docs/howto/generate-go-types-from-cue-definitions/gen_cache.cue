package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "Hhbo1qNwCYJNxeR+u/s6LRuIbGmdWbKYhavzbyAnJfw="
								"cue_types_gen.go 1": "XEWjXapd4EiwuoXKmNtQgbUi/RIh5B9IPdeDJFEKFp4="
								"example 2":          "6z3RnpErcIKeywfsefWmCMgBe486YvtR+0tmgBQfO4U="
								"cue_types_gen.go 2": "wtB35y2uOZrAfjEuVKU41f4oxYANcbdfWFOmPdjnzgw="
							}
							multi_step: {
								hash:       "I6L6Q789K069E2OA0P15FGA7MQQ86E73N3H5QC8QQVTQB7BBQNTG===="
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
