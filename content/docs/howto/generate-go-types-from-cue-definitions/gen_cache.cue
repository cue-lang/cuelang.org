package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "zoseXPj5rr8dA5GA9PnrLJLMTpOuAMoV5izKsQ1fiYs="
								"cue_types_gen.go 1":     "QGxYa0xmWX8JNdsLFXWoorZXPZdOdtOqVSEXgJOHEhU="
								"example 2":              "8F+6n7GxYPsoHTO3hS0C+ZoM9+EJhu/NKuWJA3xet6s="
								"cue_types_pet_gen.go 2": "IcSoy/bK+PusxRocMZNws/rd73PuzahF59oUn+chgeE="
							}
							multi_step: {
								hash:       "VACO23R1J7K8GBC4A3362HEMU7PKPTUSUAI1PGJRPI2IAT4GRBBG===="
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
