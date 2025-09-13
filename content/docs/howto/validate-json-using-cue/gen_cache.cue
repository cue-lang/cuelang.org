package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "kEgqIIVLKJkNcS6J4voSlZNYuNQOW1ZaT6PdO+TF7gU="
								"x.cue":        "kAEZq/iCKBBVQN9rtSEWQC+JsuQ8W6dPigbDNGShqkw="
								"x.json v2":    "1ui/Smvh9AA6tEDZuIhTpYCZ+P8VOt22ZbYl2Z8ySa0="
								"fixed x.json": "rzjpSaepFajiqDN76sYzpDJc0myuzw+KiFhApG+zi8s="
							}
							multi_step: {
								hash:       "QPD8LRDIV26CG7H185VE105CQB86HLR8HBOVUSB362FP37S2JNI0===="
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
