package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IzkDuYLG6xKc7H4P4vmfgxK0xQ288NS0eYGxoj9Qkvk="
								"2": "+KyYJ55BrA0HF7ZTwp0MUMgdF4hS5hz/14tWacJYTL8="
								"3": "ThlD2ZDTs1PSsPRq625uqN4/X7c+sKPiVBNrwr4EkPE="
								"4": "rt2IqVPjuQOtxJAnipjd6BjxJY9kykXyK/MTZ69hKZg="
								"5": "GXlbN1R8voC0XRhaupgix3CQdpBOVJ9+ZK8XJ9qjVb0="
								"6": "zp06ZbOVeRJWDVsu2lGVgqXCSlmtIK4dJ/56Msr9v04="
							}
							multi_step: {
								hash:       "NP1U0L7V65PLLR5QLRRKELFB8827JJTNGV4I2G805QAEG9CQU1K0===="
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
