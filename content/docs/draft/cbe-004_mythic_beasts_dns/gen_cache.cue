package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "3k4xClxdFDCoSVPuCspF/4qHTGTNpYINDanDHDuZyz0="
								"2": "aeAxtx1IOv5FBejmAfzAl1EyUBfwZvENzoI0Tcu7Y/Q="
								"3": "Ryxd51X8duK7g0yut4E26sObcfulHpOM1lv3RodNXUI="
								"4": "0q/qMgKMjFTf/ghuO2brorB1Sa8R6dHpuZ8j17Y+MLk="
								"5": "FRHBrUvE94c1Fhwcy8Omyder8RVJZISULdrix/UZ/Sg="
								"6": "b4WFsO7M54hKZXu1n0LtQNoaNDTIqszl83E+6uKOhbw="
							}
							multi_step: {
								hash:       "C57PR9EUNN66002CI7VL8I0FD7P7EHFM1PVIBJAPR5L0O1RV1C70===="
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
