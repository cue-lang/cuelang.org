package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "CKj1NtrEkfOEiMPViI9Jc5ZdzLtvTMsoe+dSgNn1iao="
								"x.cue":        "6NS9ywb/OvYa3cjGR4KyZwGfJXVCcdUaosOhwf3zgQ8="
								"x.json v2":    "01h3r0W0SPE/cbpoG+hrn4WtQqU1HuwXHBdlXzKCoEU="
								"fixed x.json": "p2wxVB4sRIJcQ+kfq2ZS3mB1AdsztiBaHxd/w8uJB6E="
							}
							multi_step: {
								hash:       "BQ17M9PQ2MBAUUIA0HUDG4OSEC2FSE8L359GQ13VT8HJST00R2S0===="
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
