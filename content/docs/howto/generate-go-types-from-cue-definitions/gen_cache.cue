package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "LG+2GGEbtvl8RNCVlpvT6ojJaxOcgRlrhy6tWDD5r34="
								"cue_types_gen.go 1":     "MScrCf32B0NLZyf6z1LX5lIansFq8ObvZlsxWnE/XlU="
								"example 2":              "svy4H4+qdC60BWW9MYvBqSUDSegxBz1L1RHzsX+qjOw="
								"cue_types_pet_gen.go 2": "T3QpPU8A7O+XDb5xHDZqsalax09XoSWYE5BRsQmKKDU="
							}
							multi_step: {
								hash:       "VM8D22EHRJ031IPKQRLRKEF0TI5VTTI5TH5IN79M0D55MQRS0S10===="
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
