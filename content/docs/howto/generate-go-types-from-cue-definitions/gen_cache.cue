package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "1iTaL7bv3mm91NzRAvALMdkGvSlFQYYrtQCk/I02/tc="
								"cue_types_gen.go 1":     "XkAIsjwruHtRNQgdxWisJBT+2Id5NI8tzWhuVy8dc7U="
								"example 2":              "1GgGylW7EqeTb4BelT0jYp4h8qwEoAfdtJu7oC+urRM="
								"cue_types_pet_gen.go 2": "bMuNVHdCwlwKRCqCbdW0Xu4DWXS3pgEVm7gQwi2NRFY="
							}
							multi_step: {
								hash:       "HM5U90MBUMSB98MTHINB0BBIMJRD9DPRCFBQQGN8KCAE1NCOCKE0===="
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
