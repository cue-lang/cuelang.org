package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "8dxyifQdJN6etnw82aVt8dH/Hpc9MbakUXpG1V0Gfqk="
								"x.cue":        "9r4OA4uu0rq3VJ9rwB9lfOXUkTrabnZNTF0PGRCwACM="
								"x.json v2":    "sJfnSVrcnE0p11i4Gc4qvBf/xQr2x9iTaFUGfnAZ/qg="
								"fixed x.json": "tpaHmkNlDUAWrjDrd9TTfdm8yU8UXw/eS2bMxR5wdf0="
							}
							multi_step: {
								hash:       "4LIQT1CRBKPL3SOPBP6ILK2P6IC5KP20P0VNVH8J1RQ4NESH7JOG===="
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
