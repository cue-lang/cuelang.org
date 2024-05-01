package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "L32jAkg3om6j8amYU1Rh5KtDovAsGy8wj1aCYfS9LS0="
								"initial x.cue":  "s5SxWqCPjziltnAV6pUj5a8DevgK3zxcLE/AS15IcXg="
								"another person": "7gMH8S4Kktf06qDZHDk+mqFoLuSsXZvLk1JrvkwEaIY="
								"fixed yaml":     "ER4+MY/j8eMB8dB1kj4jIrBpwiQy/xnrRQVyBHJl8pA="
							}
							multi_step: {
								hash:       "23IVUU5O9PEBBNFG6HBD9NMK0DRUDT3DG59SSN3S1A01RLQ2BUGG===="
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
