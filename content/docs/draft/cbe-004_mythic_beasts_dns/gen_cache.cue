package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "BvSiOWkPzdoZa1qwmXDQr/d7xvzxPabnKzkFwSWxyM4="
								"2": "HKiD3XZmbMSPjnaITXdP1sFh5v0k2X0KwGeBjQYtoi8="
								"3": "qXq4xxcj6P6Z9aqKGSvnIkvrsnKWK29ODt0OY+2dUX0="
								"4": "kkiFFcs2B6pg6WNKRplJCZJ2d8h13MyzsivssJUUTZ8="
								"5": "JZ7faDpSgBUkdosPYKB1UBv5IePwFAa3PSDFdwUIFWY="
								"6": "pKcCdi+yQ0QLlJ1/ujTSmd6ff6KQcer3aQAUTWJj8QE="
							}
							multi_step: {
								hash:       "RKHT4OC8O3T35BR3815QVI63GBPTSCJA1RP0FQQV0R6DS58OQDTG===="
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
