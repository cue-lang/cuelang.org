package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "e+5Jq8Fw/+7Onv+RrAIoUu2d0fpzkwkYA/Fx+Xa/C68="
								"2": "D57NYANMrhZLdQeQzGWFChOid3URdz83VyaUqLAMxms="
								"3": "psYjqvvB54hkTkinAfw8jW6j7VouRO8AnD8zCrrKM6Q="
								"4": "Ex/t+BZ5IE43dtmiS+WDHSmL6YtV+vbayR99Fzscqlc="
								"5": "Sh7IpTGkZNf8SYxg14u6pA43zhg1hJ/clyZvS9zjntU="
								"6": "lIwt8mW6lXSSodci7sTOJvgnxb1d6HXAEVg2SMu4MjQ="
							}
							multi_step: {
								hash:       "9CJ7P3454O2M15U8MPQG8DTB753T0N4NKCI1JJVPH2POEHCHBGCG===="
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
