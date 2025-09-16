package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "rGFxKrXhlHXZecFN6Z3p//d+RuZU8G6JuuROSMXwgt4="
								"cue_types_gen.go 1":     "BKsE9YLhQ+JzrndXk+b6TA0Rmu2a2DYghGNgx7ORXvs="
								"example 2":              "RFPc75PJCVoUb8tRnlGMXGoNvEKrZ1Qfjv0wf64cNjU="
								"cue_types_pet_gen.go 2": "HgtUcJzQvUhO+9JAJTP+2F/35XwRRKTzc9ZRZuEUAcY="
							}
							multi_step: {
								hash:       "TL2QF395TV8UQBS82F34NKS8K14B2584TU17QIALLNUL3KL5RGJ0===="
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
