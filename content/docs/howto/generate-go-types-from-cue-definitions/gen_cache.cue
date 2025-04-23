package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "p8d6DD/p08G87MsX75M207OQhSbKbSByw+02mOFNWAQ="
								"cue_types_gen.go 1": "nqPYnc6WEfBv8e46EY2rAsotRTY9e7s0FIZDtZq4F+o="
								"example 2":          "3k4sMFGaXNmmrDf1bJi1F5XoxnCQtn92qkoQQM034Uc="
								"cue_types_gen.go 2": "f/tVdviXHOMyF8RFI2MFInINNw6ZyDsQ/McPlAj66pY="
							}
							multi_step: {
								hash:       "MJ5L4ELFC1TPCE98MEQAVRCNJHD4LGCHBL2768IS0C5UG9ER3TV0===="
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
