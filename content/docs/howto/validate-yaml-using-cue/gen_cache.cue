package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "sF+Qqhh1rJmrgp5X39vlcLFWM21cT72DXIAj72aY6FU="
								"initial x.cue":  "2MbArb8O9bDTmVXKHqsvmcRY6qSHE3SiU3x4C6yg0/k="
								"another person": "U/nYxYVCVCu9qpwwQiOnr7vE/1XY1darEtFeR/JwQYI="
								"fixed yaml":     "MryjVhhanOuB12mU0sriTiXs+R8g/3glfJFbrzyWcvQ="
							}
							multi_step: {
								hash:       "H7S6O0VE5ED865TJM7I6FCM1C762NJQV0RGS45LFFNM0452QO2F0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
