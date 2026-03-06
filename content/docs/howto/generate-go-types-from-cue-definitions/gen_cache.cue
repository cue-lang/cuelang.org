package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "yyexrWO6ccfUrdQPnCaPmT+zTTtSKpleZMTGAnvwjxs="
								"cue_types_gen.go 1":     "UVpt7IymdD8rdvHURUE3XmVzTbTmkHb278kr842/YGg="
								"example 2":              "KSASF2O6LgXvfrCTEhxKE7K2wSsGdHur9JH8RKrwu3U="
								"cue_types_pet_gen.go 2": "yQGGs7FMGkOv2eEFDGD+/5eWMwXAYavsdisgsisgpq0="
							}
							multi_step: {
								hash:       "M3P7HDLAU71CR0591N2S29VQJPUVIDK9T16L95BTMHENPKS8TBBG===="
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
