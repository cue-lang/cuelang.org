package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "tuIpV0xI5btDrN96Oxo/OHFhvV9SIFuAHIQJoIYLdaw="
								"2": "7pslX8gbv+K/kq5UJT5I8iHSf9f2Rr1YV0tYeqhvwtA="
								"3": "IDIp5wg/guZk0CSgm2Dx5+JOOvF5WMkda5Uw8ndmeeU="
								"4": "EJ69l7B1RWlo+mRc7mNe2u93ufPrv70aRaVlHiwzhOQ="
								"5": "XPoNV5Sid0AbMMZPgElkoygGuUKFv/MvuVb7svLbgms="
								"6": "6/vRVIzenhobsnnMbhtBgRBm3rRFZJPOrZF/Mo6WLL0="
							}
							multi_step: {
								hash:       "J9IJUK4RB0B0VNGFRSJDL8R8PT6945TM5BJ21FIC9SUO2N1D3ULG===="
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
