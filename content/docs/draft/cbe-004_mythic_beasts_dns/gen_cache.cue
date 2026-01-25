package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Oo/55UKlr1EM02C/xwnKziQYRL+57lXvoghJ5+kd3+A="
								"2": "3bL/0aOdhsfQfNjCQBvf5Dp8nsyTOmpZYgdNYW2jsC8="
								"3": "0M+UOVI0a0kSEjzCCKU8giLJayTYnetrJZ1OhniP4xQ="
								"4": "TPoM2v8t0gVYzOc1pSLIclpvM6NRvUpxsV+Bx0qqQ6M="
								"5": "ad6TjGhcLzaJDAul+p2k9nUgFH42RRd9ohtyTT1vr6U="
								"6": "K/KtW49pZyn1DuYdFF9ueyO7/ktKFBQ3JUkPSU9aAu0="
							}
							multi_step: {
								hash:       "G8M2GJI78OOMARF2MPG3KNSG6MB03J19G30OEP40RKBKGFO78BE0===="
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
