package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "++OUy1KmW7A0I5JWLx7L5uKYq3I6NP7eQ9Q8dWLWXIc="
								"2": "3e9tYz8fAhVOGTeF0pMrsxLku0Tv17haxwiOUrFReg0="
								"3": "nBNfGfAT2KriqHgGerWy5WBJJyAzW26l08tAdBUUrCg="
								"4": "4JHpCrC7+Y5mcX3hxUKh79Lvscc2Tcho4xBdiy2KIno="
								"5": "wDfALgbTAWpQP5HzJwwrXtgLP+Jf5+AGJse56xpbaK8="
								"6": "VMTqGPA2nInNwHNehHf/YRxE7ZgUeFHqpcQQRzLShsg="
							}
							multi_step: {
								hash:       "E8R3EK0V8LHV1UN54TGJS48EKHFKMTC2VUR3TIH5VN97S3MJQJ60===="
								scriptHash: "TBSD7E08FTER7Q7L3RJVPMEI6TPH95PCHEEJ47GV2E8D69I7L7DG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
