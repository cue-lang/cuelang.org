package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/Qa5M3RvJhM4+obawnHSXMBcNaUOvieTyi7XqYPDSAA="
								"initial x.cue":  "H9HPRkttum2KKeCd6fzgaB7OpM0N0X2qhRTGX5sWb/w="
								"another person": "qpb5EXPRd/cs0jud11Ldkfz5He9pJ0NgK3V3uV5Uyyc="
								"fixed yaml":     "NemCwnYkzV8Nrcmkz8onGz2lyIOvsC9vDyz6akCyh0Q="
							}
							multi_step: {
								hash:       "7DEC1NJ9GB33M0VFL82R6H8G3JS9M5I0FTVQE35KBQL251Q87PIG===="
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
