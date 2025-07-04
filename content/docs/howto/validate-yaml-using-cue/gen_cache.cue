package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Z4vy1zgrF5WaxDmx22OgI+ajKaLPnmktw2PKoHw5d2c="
								"initial x.cue":  "F7xI0u3aRykcbNy7dVN4J0PVVv1WHH4zuPhcz7vianY="
								"another person": "peKN8roEqJOYp2NYgQtCQz/sMMIcmKAnHs9qEaOaeYI="
								"fixed yaml":     "b7V98vjdF0adfSaEJg9cIupdjdsWjhmHmJsu/wwxpag="
							}
							multi_step: {
								hash:       "9011S6UPAM64UCQENDNLT082LKBJT543KF6LRR3PS6KAHNUE3PT0===="
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
