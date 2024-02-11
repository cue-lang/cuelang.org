package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "CIlkagRSVuFTrxG3BSrqAcd/HxmYgCrwSn9XGDFEkQU="
								"initial x.cue":  "dySWMYZkQMpa35Pk3f8LW+QREJ4OAQli4VoVDwxIPtE="
								"another person": "PSzP7yhq/6XbAbFZUQ6pwtokLhas+dbGlnm/OuK9xKQ="
								"fixed yaml":     "VNOJp5VoEGrKF2p7fwuGL11AiMqBIWfTaF5m098h8Zo="
							}
							multi_step: {
								"MJJAEUQOQCAJ4FHN1FMA8PGM7IGQQLLB4P7OEA4R79SMUSD6SUN0====": [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
