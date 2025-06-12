package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "08mLF+1jJ8mR5sDz9pf7LsqZoKv4vQTu5uwc/lBn378="
								"cue_types_gen.go 1":     "33sCnP5m3fAwHzR9dPThj5NqJQrGPGEX78LkrJyPKUI="
								"example 2":              "hJcMTCNOpD5Q9YCO/Pznxy5gDinRNoERQD6ny5I2dEM="
								"cue_types_pet_gen.go 2": "NTiWRpXeJIP7ftYu8MQyMKQEHs87K/O8ooJa7+k7vPs="
							}
							multi_step: {
								hash:       "NGG6LSPSLKJETHJ1R9GHPUBFS5K3EO53O1B3QUGJL8F8QE0OKQM0===="
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
