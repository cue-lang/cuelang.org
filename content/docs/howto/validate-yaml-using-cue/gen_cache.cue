package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/7fsEs2QsPTy+ufGWPffPK2KqzVH/uGESEFhTAxuZEo="
								"initial x.cue":  "+UJfX+j0JLOul6oD80NJVP3uG4eU0GXA431KJwuhVG0="
								"another person": "semq4dbf/q1ZbP28taGcX7fTdG6e+fcB1/rVa5mmJwM="
								"fixed yaml":     "JPbea+cTcjoDnpOyQQCgS2OcAFLsl0qDRuDP6BBpdbg="
							}
							multi_step: {
								hash:       "NRHB13ARFIQQMH1H8JFUA0ONA4N0C6IOT364V368JVC8EE2F9PPG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
