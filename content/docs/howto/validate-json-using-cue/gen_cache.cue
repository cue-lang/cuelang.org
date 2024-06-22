package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "x2xSZeaqq0idnogrvw5cvzn+HV5CA0NYbRYqAUd3ox4="
								"x.cue":        "eMvU4fTNRgV8Mc1Dm3Mv52yvMBTkiLMK/wS5+bkri34="
								"x.json v2":    "C9q2557FpcqVYFlkGj5CO/hz1F66BJGm6GJPdy350ig="
								"fixed x.json": "mA2aFnY9AsJkLn3Qtr774X0qSJvTKyCh2RHbk6PbxEQ="
							}
							multi_step: {
								hash:       "OMCAU5KK97TM00CDARICBALKKVJ7RA4V8FJQ8NAM3QD1V0BFA88G===="
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
