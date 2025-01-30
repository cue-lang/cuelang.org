package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "mxodxD0bd4CKg61KhmdhNNVSlJT4NvCi3ASDUKlhoC0="
								"x.cue":        "QKeD67ozHFtToeU4U/Pxdd7d1V5GZwT/bDjkeek0VV8="
								"x.json v2":    "AjWsQZAGM5RCm2pQds8Hr9gVfZVCylM0/dLRzu5cILs="
								"fixed x.json": "J59bleoI4Uty6xtPtraEqIHElJSA3uL07PAWfEobacc="
							}
							multi_step: {
								hash:       "1J7AIFL9M0DSJIMTC7DFC0T0EOBV5NI4CATT4J4OEG6C97V9AVJ0===="
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
