package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "5ddVZatCXrKsw/d6nDa5bdZekYZOdixGczHNeU/GQ9A="
								"initial x.cue":  "auLlxvO2deK6tgb7CsFljZnnpvdRMKxhJfgTY6fNkA8="
								"another person": "9OI9nNmgaRl2JPO6AotNYz8NFrqIElPD2hwEu5+wELI="
								"fixed yaml":     "m2dd9JheYhh00d5VZBkq6Wjc8UchXgPwwh/TNuM3UnM="
							}
							multi_step: {
								hash:       "MIAF978A7EOB0DJ9NQ0LMMSCTB0E54DNS7TS6EBQ4203LGHLM2N0===="
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
