package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "41VXpTdKPzB5Ro+5U7DqhOVUnXwit9x7wl+xXA1vKGg="
								"2": "4nGQz5JO1kCGZ2s+ghU7HElpdMrqDztKDqjj0TuYBuU="
								"3": "0koKJtJ2PgltjSkekojn56ZDraHgv+q+WT4dqPTXD0M="
								"4": "fk6zdrIOKRBIjsfWedhLpxJ/JlU1ymL/3V0s2W9ERyk="
								"5": "yURYS2VUxYn5PnanQ/I9MBwwn1Pyihrv+AumSUADvYk="
								"6": "a5+TD8Ynn8LXFGXibCZWULHy56opRxWVTj3YbATFLds="
							}
							multi_step: {
								hash:       "UDR7IFDFS7HHR9212TSFPENTFBQH7FFPNFPMEI2V28SRVMG94LRG===="
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
