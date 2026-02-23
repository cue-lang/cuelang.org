package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "vfJHpdst3v+/3YcX5atjNgiFdqT3kmWVwwQBf1efDs0="
								"cue_types_gen.go 1":     "QAeYogEnNaQUw0gKWOTky8xVfnW2OwXz8QTNfZjg2Bg="
								"example 2":              "Yi186iQSAUCM4Mfp1YuZZLQ87GASwoWBp2K4UYOGLTI="
								"cue_types_pet_gen.go 2": "ZVyMvfDWnVGXCelJzrX+2zTxIDS962v3WaJNWe0cUJg="
							}
							multi_step: {
								hash:       "K2IRCOL9SGVKP7M1LQ1DIS7M9109AC25JP7NBTHP0041BBGJEPG0===="
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
