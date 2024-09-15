package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "WotcKnfg1PtP+uiV1FJYa3whCkgQyv2YQ21Xl531dHA="
								"initial x.cue":  "Rk4t6Hi1s8vZp9eTb/uRbuDCpXw0c5PgxxT1INS1554="
								"another person": "FYJMJP6xGqsCkUuLNnyLRh6D5aSF9r9E8d875ZTmCJU="
								"fixed yaml":     "5jswPk7NVIY6gBLntG7wMj4N0Z4k36buJDYtSjPgJtU="
							}
							multi_step: {
								hash:       "09LEBA0PP938OSD8UIRFCREE5J1FHQPSN1UA0PJG0CHT4JQ73EU0===="
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
