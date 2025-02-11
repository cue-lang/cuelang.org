package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "KXEmsIyx6BXJ/9bsIifTaMHoXmJg4Wpq4AfLkSeFkRg="
								"2": "2LmiVOxSRd2xZLZff1xqpK4a5GZtuBIQ34EoYItQHUQ="
								"3": "X7k2QDpRXiJZoVMfOtQcq+ba1abpUiTtaDIUmK3e5HU="
								"4": "DKTNQL7Xnh021/ts05cW4IqcpFDkMFmNB+s5xLb1f4I="
								"5": "2bykxxgpFdAaNZgfFR4JsJXJQJs9rx3EbLfuktKPM9Q="
								"6": "jR0UGvsI9lkPNt0BxPyKThz4MgA1lMVIBP9khjFix+E="
							}
							multi_step: {
								hash:       "DQHLLSO2DLSP174CBUE1I2ADUHM21JL33E7MH2NAVGUP45UACKOG===="
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
