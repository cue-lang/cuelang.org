package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "w9dqxQvdAzzL3c1X35X+sehkPFKpmfW+XRN61DsjMAo="
								"cue_types_gen.go 1":     "DsHFCiZoIstIm/ebH7XsdCFqz+sT2XirLOiuf3vJG50="
								"example 2":              "boRnATOGgDXsFPOdip6DhtN+yxqyRUHMiQjKpzF8CFI="
								"cue_types_pet_gen.go 2": "GExRX/LKj51gYyZju9N8KdC0nWnCfRPmehjqg+oif9w="
							}
							multi_step: {
								hash:       "0KK6LBGJLS0M9PAOIGM5EI1JBCFA0ON4L59IAA6OKLA3LNSGJ6AG===="
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
