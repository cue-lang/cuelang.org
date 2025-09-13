package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "M35CJFF+QFBMV0aHF5SyGSdtDPhKVjjBCNOrWDo5Xy4="
								"cue_types_gen.go 1":     "LsZovcpLwYHpV7NOOXMTn86oJEvnDVwVyIk1LlLodA4="
								"example 2":              "57XpX86GNaKTv3OqDBFOcKHXwff8EcTWJxLTj1pbIP0="
								"cue_types_pet_gen.go 2": "grIqHRn39AmGpqhnYu5dwYxiA9XOY6rLMZytLOw6zBM="
							}
							multi_step: {
								hash:       "359TATL2FVQJMH8UUA1TP5JE6OGNRJ4BCD5MIIQ568U7C7VLH0M0===="
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
