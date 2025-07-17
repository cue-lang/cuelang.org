package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "kQe+WUS/5D663J89rlKTrmWApevFCDhQHR7Q0Lvo/DU="
								"cue_types_gen.go 1": "WGMKO4JQ8e0upsLdwxgtrnyaweGGcQWzL9g+urXOh/g="
								"example 2":          "Yerv12NIRNJsKAocMYBgeUySEcgoBlm6Mcct31GWwnM="
								"cue_types_gen.go 2": "TydL7pzhMF/uNvqzuoO1LeC66+0NcNsB5x9/CvYEJQo="
							}
							multi_step: {
								hash:       "KLN8F6O75BJOG7TDPVLDDLO9CU94NAFH6B48K293ERG8V36K68M0===="
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
