package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "B7B8kN5nnACN8wOtTE/KeYBDBsYHWUBVcliu127YcNE="
								"x.cue":        "E5QziG4FdmOV6+KjP39A2+/EpIPswqs3qfiZ3pjD2VQ="
								"x.json v2":    "LuwfsAiYR7T42huKIHFst1IDaXFw1RkKPKLwRWJobCI="
								"fixed x.json": "CYJYG55fKpu0FMHmxqZfS/I6ozgfbxFOsnm3PZdTkzw="
							}
							multi_step: {
								hash:       "4GTVOQRESEM5HCNRAIFME6QLODVF8P6V74QQGQJ2JA8TP1LE4MR0===="
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
