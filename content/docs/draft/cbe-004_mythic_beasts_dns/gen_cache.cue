package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "b00F65OSKxDP16T1S6babCYT8pjWrxuqMB31P5atVbg="
								"2": "m6W+jAXIOHJRzXrwE+8jgvINN82Xhu4D2lzGuKaY+OI="
								"3": "hWodHCNT5Pa5mmbzPbD2dbvcU+RKM3Del8ui/PU5ktk="
								"4": "YPD6CGu3oXTyOJjcpaqW4gH8OXWW/bd6dHhcpFA/lys="
								"5": "Iq0IL+1tV3Md4YILpYhs1OjMCM6PrFF/zJ0+TaqZv0w="
								"6": "0D1ZZyH5JSvb6bjcuKMQrCuCkxu8tHt69ONPYWOFEgg="
							}
							multi_step: {
								hash:       "BJOU89PR92366RM3V0HRQ13QGGRROL9FR7BHQTNMO5DD498DM0Q0===="
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
