package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "9eP+ZKwjs4/5JBfu/jVvADnnR7Qyh9NUVUJ1sVMW7y0="
								"x.cue":        "lYPre8K0lwXqfhg5NmeezoOAQCeU1/0Gk+i4i63MlM0="
								"x.json v2":    "0luMVBNRCCdlQhGvU3js4yTQ9qvkTMvCBIbZRFVWhA8="
								"fixed x.json": "X8z2FDAk32+I1EQZUYgL56GECDZQ5zQoT5ObbIfkfdc="
							}
							multi_step: {
								hash:       "FFM2JMGOORADJJVRFDI74LSHVKO7L4TB791D7CMN478LAHM46FCG===="
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
