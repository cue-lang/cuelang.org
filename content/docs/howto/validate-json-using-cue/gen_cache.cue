package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "4aXuPvYlYxP1tvKvs2tsqZ9XnjOqOB0vJ5lLSH8Qu1Y="
								"x.cue":        "H7U5DLH7rlnHdB4J+Nd6xjNM1gBsztD28RYUuc78XZo="
								"x.json v2":    "GRYEimJyvrkZaGa0JF1uypiZd9913UzXFgTqgdQhMG4="
								"fixed x.json": "cWUpn9Hytvx8EIJ0h4exS2C0wP55r9C1Fp6W9g3mJHE="
							}
							multi_step: {
								hash:       "V88O727S4SGUS48CT22MUG0BA8D22P2KGGSK4GA23H0FJ94A18C0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
