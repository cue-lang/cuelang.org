package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "rC9GlK1Saze/a6rwvZ4v8PnEi3XoX7GQ/gLOsxzJA4Y="
								"x.cue":        "AEXQKmseMRo14fDCPzY3UNTm5hRT09qimvgHYLUwdZo="
								"x.json v2":    "fgfaeFtA0uPVC49sel2SeUmvyw7OGWOokwscAXSBymY="
								"fixed x.json": "J+MTVFWF+7CZNemNicngGL2qXdowfNID1sJ8CNR8zUE="
							}
							multi_step: {
								hash:       "6F97599G5SVTJPJKERJB65J08IALQQ8RIEV8HI7DKKRPDH1K14KG===="
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
