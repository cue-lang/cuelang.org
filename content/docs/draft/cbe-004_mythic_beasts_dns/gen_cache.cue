package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "XsaFaGaaIj1xEKFtX+9RWw97ldPBsQkY3XCfBUCUXQc="
								"2": "JWtsx25KbSAWncNzV1DmEj0N97PFlWFmLDhgvMKE0LU="
								"3": "asJ9wEFSx8t8OXWZIQUtTwmFFsUWclap1okL8N+7ZF0="
								"4": "zDy6hADKUJ0YnK0Rprl4tcLXrHCCLjrq4t1Yl1skrts="
								"5": "IXB0qDG++FUpUU4CJsItIayMlzkZmmwDm475VE/dLlE="
								"6": "KX3AM4s7x0Z3XLV9OSyBnb7s3+qZo+qDYLLyUH8U5DA="
							}
							multi_step: {
								hash:       "PKHJ6VENS4EEDJ1N7O4A32OCVGS93LV9PTJDIUFT7OHRM2L4U2P0===="
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
