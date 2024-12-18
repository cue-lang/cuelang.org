package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/4kmvgQQhpp6XXgmW3ynZLkvHEJ3X1GDM88Q9WTqHRE="
								"initial x.cue":  "8W/HZjqX3PoBWvms1lS6YcUW6SbIw6jCLl7gTLKnnh4="
								"another person": "b8azlnxtuo+/VkWCCd1OfzS8r/n/cQSy/DbNBVgjof0="
								"fixed yaml":     "AZrDlKHcU8O0NPAaWpWcz06oNnufCR4nPpgUGVsLlG0="
							}
							multi_step: {
								hash:       "2R4O6U7QUJQH13P2AJHG0PCH655KNJ5IN9NA3NOQ3EOMMEPKAJDG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
