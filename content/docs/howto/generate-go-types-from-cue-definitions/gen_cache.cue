package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "YZP770Z8ro5DXzKNDauugVVvr33oGUVxmFVZC8dj4RU="
								"cue_types_gen.go 1":     "1RVXOQlSCfMW/Q5WslpIt6P1Ja60LFPFiDkhirtFvBw="
								"example 2":              "RXmpYM+vuFcS+AfBHB31JcOUgYAsWCCKvSKCPL0TWnc="
								"cue_types_pet_gen.go 2": "HYEkXm/bwtHVj5dPCaJU4Bcspmqs1N1OzV8QhV+pRAU="
							}
							multi_step: {
								hash:       "IE3TL4858TOKVBPPCU6E2ODT180PR5SRTE53FSSDBUL408CJTHFG===="
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
