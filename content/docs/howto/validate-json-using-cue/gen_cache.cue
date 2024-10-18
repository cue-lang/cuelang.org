package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6C1LzJI0q4xT6XqgeYRP0etPSgicO44S054m4ghcxH4="
								"x.cue":        "pvBAnocp7OsP4tmcAG/8H9HIlo0swk75eDsaQXjhixY="
								"x.json v2":    "MIXqz5Iv/bE2M2EnmO+UNnt6g8xFL5YWiRZhgUBH4UA="
								"fixed x.json": "NLd8vE+iGIEsXr+R7sj6lf67ndluEDEawLoFXNCdd00="
							}
							multi_step: {
								hash:       "FTR88IRC0LMV4CVKFET7UF51GB4VQDF204FCPI9GQRBC14OT57JG===="
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
