package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "QMx1138gZrwqkoU/iTlQLQ3HKWDIwGnF+Ur4iZdzx1s="
								"x.cue":        "cfk0aPe8nKSfEe5pUXstQYZOSgBPwDzfhsGSwexeLlE="
								"x.json v2":    "waC4zciAwZBnifs8mAAZOvrC8WNn5fVMWedPB81stUU="
								"fixed x.json": "vM02vHZ7/gCi4rzNdCSE+6pdx0VaKPdCvO2UqJyCDjM="
							}
							multi_step: {
								hash:       "V1T27H6NEHLP5AGRLTM2P95JO6UQBL9KRVJMF5JIQOS765QCNLP0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
