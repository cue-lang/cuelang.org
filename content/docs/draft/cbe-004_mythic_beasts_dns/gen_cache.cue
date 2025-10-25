package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "kgKutRWuwm0L2DN7qVBdYfGxKDPabDybDYA0uIg57b4="
								"2": "lCaYF7oWazkTTJVhYtngocyZh9FwmUxzxVVw6y1r0h8="
								"3": "MgK9kPkPKmekxObSj6WBf93+Z7idROaCPTWyg0qp6KA="
								"4": "vtMYjthPxnsqnK+Luz+sjd4ExWe1jypmbrLbNyVpiFA="
								"5": "v/HNQnHhUwxyz0BltketHkvcwaOT9Iud7GcX9tDdDb0="
								"6": "sZyBAl5XC2ddYZX6LzStNhbWd8l8ewAc9yXmkzu7rfE="
							}
							multi_step: {
								hash:       "P23S82NR45RFM37DLR9RIAUQLHRV93G5M1INFLHE5VQA2TUJ09S0===="
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
