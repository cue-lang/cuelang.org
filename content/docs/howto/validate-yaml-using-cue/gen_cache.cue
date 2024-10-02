package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "L5YjDM4texrPSXWb0WvKKXfcyyaWrlCYC6Ux349FOJM="
								"initial x.cue":  "bzuWg8wZf6NCNnddiqINffu2wC1XQfC7a9I73GN0vq8="
								"another person": "oz9n079nXqUn1Xiy8N37XXy9nvYjfKBSwn1tjRFEnKY="
								"fixed yaml":     "x6VPVWjuQuCzUFQMCEv/YLMLWDoGtEQqVJBCXLN8XM8="
							}
							multi_step: {
								hash:       "E7CTONUIQDCE8QMIB6AI79V6S2PPPRRI663PJRH6TON07RL31S20===="
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
