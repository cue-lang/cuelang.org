package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "T/I57XuyD+7X8iFhZHjRDc2yGByGNWTqcs+DUJF2K94="
								"2": "aQP7NlHtqO3mco/mJ10wHrvHqF6sDFrV5B9ocz8tj/I="
								"3": "oA3l2nOxvaKX8a7Vbh/mgdGzQcsMswaPXB2HCJSaaMQ="
								"4": "5aWTOrSwDnnoliLEPCV+/Yr/B29R2BEh9zniqjxx6T8="
								"5": "YS6lMkmC8LPta9GqmFwuTAxoiduvG9djXgDhm5ka+dw="
								"6": "WTfrKeIk4O03oQ596IyYCBswba3y45XaTJ6DXEkmXeo="
							}
							multi_step: {
								hash:       "I9R3CHQL16ITVEHJ2UESLPQVARJIJNL768TM77KO5CL7C7FNQLD0===="
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
