package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "ELyAxWEZ6zxCGuOBtnQsMX0WfRzSlTSCdvsYGXx+9q0="
								"cue_types_gen.go 1":     "z31zMMwEky5bNVGS6GkXCKfp1GFNcv+fpAZRr1MZ0Sc="
								"example 2":              "iYy53OGGbAAiAF0iyPbyT+dTvL0HxBBeqi29/pUfcK0="
								"cue_types_pet_gen.go 2": "Xt+Rjxw+vBNltzqm7DVcVjoUzB+LXSc2CvyR3l2LylY="
							}
							multi_step: {
								hash:       "II4H2958LC6J8OMBSBH6T3R4MUK1ES1PJL2709ASOQ2TKBLF33Q0===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
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
