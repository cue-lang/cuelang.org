package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "DykJF6+sLP0lM1x5UG80EgPV3RhZeuM0dhBHlZZwXX4="
								"initial x.cue":  "0I+DyUH9t7s567rMBSPhc16YE/88zO8Anzb4Sq2nW38="
								"another person": "m1hyNa5c3BmpB5JXcNVHRVgWH3opc8RpjpMC3eZCE1E="
								"fixed yaml":     "ir+90uGzsiBeTOJjqdK6qJn0/71KAaF15OtKEZjIRrM="
							}
							multi_step: {
								"2BLQAK4VFL0JLTIMHTURUBE7VEOAEMLAGRU89AK8BJCMACMA2DHG====": [{
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
