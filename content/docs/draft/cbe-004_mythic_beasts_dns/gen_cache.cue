package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "vZEWpAhtvJVgx3Aa2nLyHyaUWPImf6kLUZQCWYtsuog="
								"2": "JiTB6NpBYsVUOBzYuSEWwjXrlmDFBZZ0skfvVjbAX4c="
								"3": "uQHaVIWGpTR+3Mx6G2GWtjI6E2dWKaAqmmIHprt0AuE="
								"4": "EcQRjFFkGqTN2LiEZvDiPVffhedwPqg0tsAa5BOWZFk="
								"5": "m6URq0g/zD557F4kRbuSRWNUyLlv3gJgfRwesmF6Z5k="
								"6": "tWa20FEdHlYG9FO1zkmURoH1Z5z1FBgoh2DiBBxQ704="
							}
							multi_step: {
								hash:       "JS5DDTHUDCFCQ8Q790ES4V0NA7VKM7PPJV97JDKU40UAOLA2J2U0===="
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
