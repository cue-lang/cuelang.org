package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "G4zAgF+/+q2RQJCvvpIi5kvfmDAsb6e/ekyFsrvE9gw="
								"cue_types_gen.go 1":     "F0evmgWN/hyQ9qMhk5dMdl6gDlRisz/RyTVKBPR4odA="
								"example 2":              "We+Ucbh7lDdt2hB7dP/2wWTXOiJ79ESNMM8rkWThdmI="
								"cue_types_pet_gen.go 2": "3f5sq3tjgLMgueqZQJrWCK3E78bW6fRQ09ovJJqQ6cU="
							}
							multi_step: {
								hash:       "V0SSEK7M8OSFTFQOS8PUV78H3DENU75MH4M329U8DGBSKPA1FVSG===="
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
