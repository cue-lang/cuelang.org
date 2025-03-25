package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "1OKXm4bBLoO7pIqXPPOC5G2KK3rRi8xBMTOF3aC3tnc="
								"2": "oAJNSesYrz7U8dC1eITNC2EeBk7nupFYMgPknl9JSyg="
								"3": "AFLBdnHlSXKZd4BidgDln5FinmBh2mw4TOYY8sVWOxQ="
								"4": "lEnYDnt8SKIzEpocKF6wIqe9PqoZLSRL7eJB8Q+9QKQ="
								"5": "Of+k/qsPcIf/boeCMuVyxwj4ynH0/6n6gQaXekU8QY0="
								"6": "xGfQtP385x27ipj985AmnZkR7G1xV4yvgxlfDbHi4Bc="
							}
							multi_step: {
								hash:       "D9E8KP045LS4TUIV11KPEGN3FVG0FKHH30B1HGB6NMESUL7V0V2G===="
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
