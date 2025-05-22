package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "hYVp9VeWlovSChc4UX3pAjL6SJ4E3KZl9PVJBI6gRzc="
								"x.cue":        "wReSBYlkr4quqeNc/GuK35ffJKMwggepI5P1p/piEvo="
								"x.json v2":    "j6Dw4bZyuKFCeaKSoEBhJrk4omMMIFuGqr6pBPtShrs="
								"fixed x.json": "wDsLP1z6ZqXQTm1lz9AP9PHZIxTNRBAATEyLxrkGMEk="
							}
							multi_step: {
								hash:       "2UGU0VA8F08KUABCHU0GC4HSNNIIIQE14QUP2TQFIGK0UOOKTRB0===="
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
