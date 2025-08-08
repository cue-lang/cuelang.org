package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "hn7Rcgtj2dzKhED7o/ZSlF93Q4PjQN0VrvSDaAo7cUY="
								"2": "Gxuo9jMFh9ZrzzxoFLDfK5P9DpUwEk+cDAtYs3sdyes="
								"3": "NSV5Ok3cnCal164ggRR2cgIk+C62HPkZ761anIXCAeQ="
								"4": "+2R/12rYAqOmtozWlnEYR0Z8RatcFxI0DA2VndO/M9Y="
								"5": "Xf+gcDPzVqi0Xp6Q9ldYa7nAYgtDNxSt0sf4gaUk2VY="
								"6": "X2obRHNgUByaiajdBhpk0zqpX+8MrQs54IaIz3SomqI="
							}
							multi_step: {
								hash:       "URJPLR2UFPS52D9TN0V8T4S6FAIPOSSQIKAUSNFCO9991HQCSEPG===="
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
