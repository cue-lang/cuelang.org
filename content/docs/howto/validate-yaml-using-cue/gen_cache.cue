package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "oOSQu4btmg4fgW6/nJrwJc6f1XIc3lGa6UPkAaY6CGw="
								"initial x.cue":  "eYXO7Ll/1LzWHJMDlX3J0YQJV6s433k7RiNDiPqa5NY="
								"another person": "H1q3fZbm6nGQRc9g1odbwG4FWw4oYgiT8lFZ6U2Rtws="
								"fixed yaml":     "AaO8L8rTUTfPicIstXlgD7M3MmTDyehwWypM8WCSi/o="
							}
							multi_step: {
								hash:       "K5L74VGT9525G6B1GCLVD8A03T06NRN8LG8A2251DUG1CN1D355G===="
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
