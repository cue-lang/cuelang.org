package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "378khiKVydkT1eGdOhUvC1H7J5wOdvAtf/x6GI3zjC4="
								"2": "6xNPXJ9ujY35gNwZkYhcX5uJwrm59Mo7+PTSU5vw+1U="
								"3": "1uwT/zWAByH55pzHqIUscVV9IwphwEYaLpY8C1zCKQs="
								"4": "fPebk6moqkACNIlYFOM6cgwV/vryf++fJ8cYZXT7dVs="
								"5": "hUwyq0ZbP0TJGhR06ZPaTqRR5SY4caapD+c1iIN1C/Y="
								"6": "/ssxBrYPFH8eQMzOBAK0kOkfgfqRCMSF9r5tgerN6MQ="
							}
							multi_step: {
								hash:       "112S3B7K3J57AB1T59T3CKR1LIT248ULVDQ4MM2HTV3TQ31ETT0G===="
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
