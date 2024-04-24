package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8GITZd15BXICIxjawvz9hF4bAjrna3a6EV48Be6xsnU="
								"initial x.cue":  "P4uXUrLs9KgnbYiZhTPR/K+UzSnFGEbX1Fn9iOhyhIs="
								"another person": "BOdHox6sTCZ5d/jRixjsWQdig2JswC+EEncpsnnv/l4="
								"fixed yaml":     "6HsPzjV0oDsbnPgKuiI/dpcs4Qvi2jGh9m+Pt6BDH9A="
							}
							multi_step: {
								hash:       "NVDV4C25N4LGOOL491G9MLMI7GVJFKI712DMKK2UD9AROO2JPFC0===="
								scriptHash: "TKKU7JEF7ORT6L9TSNKD9P5J1GDTFLS2HIE28N6UHD5PJ68NL0P0===="
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
