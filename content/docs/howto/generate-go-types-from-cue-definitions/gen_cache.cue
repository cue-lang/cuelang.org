package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "TAucayDTSuBBjBbLMctXLGhpS9vRviGvb2vH7H4uVnc="
								"cue_types_gen.go 1": "S+wDFkYkbPOT5hDcjDJfnKa9hUAE4dm73i+A2yXmF3o="
								"example 2":          "FS181Gbp2kFVUMA3CYxlvfpO3dDHoffvEDbq+7bG2lg="
								"cue_types_gen.go 2": "t5MoLDVmKND4Ps1ynVT40enjHHygEJaxRt6XeZYe29o="
							}
							multi_step: {
								hash:       "IVJV04HHS1DI1F87SLU025HT1HAD3JADJK25A18NPMJGH0D1EQG0===="
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
