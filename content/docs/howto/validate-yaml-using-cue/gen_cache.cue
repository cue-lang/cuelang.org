package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "gHjRpVWQd9m17wRrVo7zuqXnxNLsnreZoF/cLFBR0uc="
								"initial x.cue":  "WfrcdYah7yodxOUkQHxzgSAIf3jDHQ6P5WKgFl4cGZY="
								"another person": "8O/FBNp+hPig9+r1+F1+lLP+SR34QSr90iB2tmj/Gb8="
								"fixed yaml":     "zVE9QEDRC36V+q3swgREs6rPzptLJwB7fx1ZqW26PYQ="
							}
							multi_step: {
								hash:       "A1LUUVBGOGON3UGVSFUPFNID5H050D63HASDQDV1JUMDODDR6BH0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
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
