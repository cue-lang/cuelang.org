package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "tWXPtVmLap+W1bj5KZJNVRkrUumNtX5uc4hC/Ogxn9E="
								"x.cue":        "Q5i89wY2mUHDY87FDV5bFf55mRXwSg3vCEywWLP3TLk="
								"x.json v2":    "S3tSukhUrYF0YIkoIzA/O2lJYR7ekSbVf1XqADHK2G8="
								"fixed x.json": "BklbKUTEpvsrnSLo1L+/W9XV47+rjaOUnMO00MyEutI="
							}
							multi_step: {
								hash:       "V5TV63U23A3KSGKCP1FES7GH3EI7HH978UKFOG6PVKR9D36GSCP0===="
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
