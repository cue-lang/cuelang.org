package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "cNPNHHI14RW7+CVqvwOGXKHbpwncEWnLkvJOK71o230="
								"x.cue":        "wKFI6tDWi2XzhfeZl7M7zmySBdct3sUyrUS9vCeqZxE="
								"x.json v2":    "Vyc5SZcXmA2sKnKTFTGiDMTLxJWjbY+Pu6PSfDy1zNc="
								"fixed x.json": "c97Ye26TEYu5CNVW+rwRuFyhlErfvUHHMhMpcAdTzyI="
							}
							multi_step: {
								hash:       "SM27E3JE0E5DR3SQFIT7E3JRNUMUM7G3Q02HUDIDL8OL0P25IHIG===="
								scriptHash: "AAA3CVDQRKSCMFV7CUP90CM199MG6USVJE9DE2KGITAA48SRPHGG===="
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
											    ./x.cue:7:25
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
