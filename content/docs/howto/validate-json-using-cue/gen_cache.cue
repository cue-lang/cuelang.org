package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "IubynKWhbt9tbrnF8AjkESfCf3wvJUsoomEibNFva68="
								"x.cue":        "m/CaZ3n/5V0xkAuoWX5XbaAw9zqDtxYH3rED69ItVtU="
								"x.json v2":    "LB8k4kH4eGcR61+p+jaD8t5SEOLlu0+mZ2VXWnisI1U="
								"fixed x.json": "TH3a/3G+byVceK4fBWOgFDDZaa+/YEaxNyFq8U5mjfM="
							}
							multi_step: {
								hash:       "ANMTHGSONADQL7FPMNL0TCGLQPIONS4G3JQ6F4FOMNRSOPJR874G===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
