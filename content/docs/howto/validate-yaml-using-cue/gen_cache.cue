package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "W+bKt48RLH7Ah32d3TN9cYI0BDvpWaG6gkTDDQehBoI="
								"initial x.cue":  "StWspICW3A8fmZBCvxeCU3j30RT1UyDUiv5Avv9PDiA="
								"another person": "9gbQkpkdB3g5vTEtkJuaNBaQShr7vlzC6uUKr97LDNc="
								"fixed yaml":     "yoRHXRa61x9xQj9GfDBU0AGttdVL8VX49e4p9sKo5jE="
							}
							multi_step: {
								hash:       "GI116D7IQA5FTAKJQU2I98O5F55N33KG0936LC1GE5713SNUNQ30===="
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
