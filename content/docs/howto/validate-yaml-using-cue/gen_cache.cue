package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "bpU3jW8UpRoKB2NBvB5NxtXHF9bM+OhcMoqts7UzUVs="
								"initial x.cue":  "RbjKedWkpSt/6kEZmh+rTjypqE3d0tHT7YeyZto7oDU="
								"another person": "l/yA7kqUN25ZDjLcPkoUZuiRzuR/7JzNQRMeaT3mYbk="
								"fixed yaml":     "IX6fGX/fkP8/QGAfenYSYUrF/5Bz5qnC/zsEX9YV2VU="
							}
							multi_step: {
								hash:       "046LH38SQC878D061V02AGTJ641F30S97R9QOMS7AFO24DTDRITG===="
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
