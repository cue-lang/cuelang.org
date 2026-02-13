package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "avuB9gkBt54DcEoYjgPp+64wEZuAzd6OryNz6ReZqog="
								"cue_types_gen.go 1":     "kxKW3Vx7ewvc1FxDgQNwqswf7V8pMdGxLOeCVDjMY6o="
								"example 2":              "MTOdJC2GWRXfPxx/ZHXgm5A4ZPTScTmub7oGTxKSH1w="
								"cue_types_pet_gen.go 2": "lZnVMnaiH3QcF9OWQ4T8rfjfIN1ZE+DokzFdAGc70gM="
							}
							multi_step: {
								hash:       "THRJUALV8HLNJQNV4GDGF85K98PRRDVQ9M06KMUDPJH3MH4GFGD0===="
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
