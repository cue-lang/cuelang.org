package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "1PW1W5iF6pqyBfXEIcabBP3uSMe9kYNDaVxg1M7W3bs="
								"2": "ao5ETj5LL6f/sBO1hn19b11RuEPOxPz6S7bsGmNWu+s="
								"3": "cBlDL+6ujoQa5J1G8EFYljGOBJh68wSzl7nnJ6keABE="
								"4": "ex95UFGdAEEUGUbzII/LlmBZzp0zfRZMKWgN5ExJYZk="
								"5": "47ecM+SlweznRYcP+YmVamgjlqmpKWTlIo6DlLeMDoU="
								"6": "JQ2UOd8Dkgy7YH7xGcFdTEVYWAKAskY8ycf3HQgKatw="
							}
							multi_step: {
								hash:       "I5PKI27BVG97SOKLCIN1C261B9B03VIO6IEFPIPGU9NTP6C0H9Q0===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
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
