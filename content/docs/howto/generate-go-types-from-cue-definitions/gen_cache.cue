package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "jGtIWee7U4nDFizDXFXEXsyK2mAnVtLossx/W1A16RE="
								"cue_types_gen.go 1":     "TZGF/d1HJqhpr9bCawPieazG0Hbfp7s86kKNBEJ90Z0="
								"example 2":              "mUanvkZbPo9ihXDBymifXsPYUh/4Nb2iu8wjINxWlBM="
								"cue_types_pet_gen.go 2": "HaHl5S+xFlwgy7JDk9bm+iq2+rGZLhFXEemHTQzlVEI="
							}
							multi_step: {
								hash:       "PQ06JFO5FIHKN4NKMD5B7V5UJ8RG46UJ194FEQ0505TRFF3MG320===="
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
