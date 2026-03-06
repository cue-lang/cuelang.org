package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "+PCFxvHRyWVSwDE9+ARIVw3U0gw809T9G2Rrk3gwyXo="
								"x.cue":        "WfkJbVm8/q/SVPN4OFvG3NOXyY2NOvIQj2VzugvLgdg="
								"x.json v2":    "riV2o5mgKnE0YHLZCUxaHjhInTDXMrsOOG/gsG6o6oE="
								"fixed x.json": "ooEg3YVIpUJzzuxCz+3XuJZkyDNIYxOUHPy8skhwHLE="
							}
							multi_step: {
								hash:       "QTKIUJGUGBHIQOPI1VPIGMOSKKH5BHIS663K1HVGFKGSNII6D39G===="
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
