package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "AldHgpTayg3sTsLT5Fm4h0k83J6pkCFYWklqMBKf2xs="
								"x.cue":        "6/KnY6iqV6Xyu0v8+RN5O7VI39GuEcSQJGntcgyj6Ww="
								"x.json v2":    "VtVwwENjS3FWqWQ2X4d2Fbv8nAQ54Pi4m7Z+h9KB5O8="
								"fixed x.json": "enehg8ZwUGGKhrKwN0cdKige0lUt06jYq1HZoHd5d+Q="
							}
							multi_step: {
								hash:       "9NGJPA4LTI5FLL121KS9GLQQAAVG9OMCKJMTUQKUS5T1IRVAMP40===="
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
