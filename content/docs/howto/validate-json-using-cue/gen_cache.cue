package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "LynKExl50v0K4JwFIL3Mdc2pdai3GzWxoAg9la8zc/E="
								"x.cue":        "6/UY9oFzeXGSsDF17XB4lsDfQXBzJV6pk6Hla+apx/A="
								"x.json v2":    "OsPcdsV2DvoqD2x5HBeSF5hr3pjtobeC1qNyRXVG76Y="
								"fixed x.json": "LIclQ6cYcjJo4DZEJVGYvpRBQyPGK9yPATqsuUsmdfU="
							}
							multi_step: {
								hash:       "PBJ6B1OQS0A8VJ6B4AL6BUIJ15M844VEE719RC1T77GB6K2K2DS0===="
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
