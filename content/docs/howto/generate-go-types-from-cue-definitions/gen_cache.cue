package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "ryMp498PDCu0dPc2a7+AGHp3u3h25Onfd6Qyl5d3w94="
								"cue_types_gen.go 1":     "hbRVIfuhsiU1OhK4fB/ybzhjRcOUAwUZOtPgTyMXOBc="
								"example 2":              "/aoALfonATdyW9MQgueS73sMTUlCQGYL9pRKZ+p8eHk="
								"cue_types_pet_gen.go 2": "jGuGA3uwIt0XbOoFVQikpGkb+9PR3q9g1YvbiyFpDm4="
							}
							multi_step: {
								hash:       "2V3ULQ4PL3C34E0A66EB6OJ7FJ9QH72VENT8HVBK3H9SV4R7D190===="
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
