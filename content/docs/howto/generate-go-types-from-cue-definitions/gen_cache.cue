package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "XxebLhiI6t0+NPPEpvGQsr7EPOkAelkwAAa4QsAizXM="
								"cue_types_gen.go 1":     "TFkzVPrKQ/4KJOYJKHlkUVpkgPjMVxxBNqehi2gkYcE="
								"example 2":              "Xs9a0X09XuDSUthbjY1eMg6rbRSpwF81ZLCfEg6EQtw="
								"cue_types_pet_gen.go 2": "qhRf6ZOGceLhm3doc50lUcHxH+6XONjorGneP16E1IE="
							}
							multi_step: {
								hash:       "DN79RFIO9CL1SLMJO30UJSUJ5E3ASBJV6SLGQKCL92Q865F62RBG===="
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
