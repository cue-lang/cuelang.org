package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "wCmIY2TTz3IBuUVXlmRBQkhALA6o1uY0QeVpKM2kz1o="
								"cue_types_gen.go 1":     "AMAYn1BzJV6INLaA09PHYdmMe/nOvVpHsxXNpxh/GrU="
								"example 2":              "WiUdFNtmiPDgDqMn45woC3/07UthO1cUTg/EUy0tsZ4="
								"cue_types_pet_gen.go 2": "6juZ0bLHtZDEuUqfUaBq+63o7cCbpkBgogdfNOnibrw="
							}
							multi_step: {
								hash:       "GDG9OR6H1LMJCTGIPAGK3GPUORNQ2C6E373RE6FLCR3Q4FF3LT50===="
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
