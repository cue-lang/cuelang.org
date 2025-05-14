package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "+U+pG19aqxExKyRsu86qOwzCJfe9BqVG42wD6yBWNZw="
								"x.cue":        "BB/uV7dmsmZ8tMD/iZQvBQalEy4WG90KrWHSbhtkoyA="
								"x.json v2":    "czibzRshHyUobg1Ba//NK90qw/3reHMOOqNGjn7fEBc="
								"fixed x.json": "9B1FThOyP3wPBBJU4S1NlCg++qm8q2hNdI7OJ2S/3jI="
							}
							multi_step: {
								hash:       "QKQJ4KSIH11R1PBBTFFLSGRN0P8T21E5ON57TS8NMRSS9IPPAUQ0===="
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
