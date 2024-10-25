package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "yzqpX4CqOJVi76nNzORBPzcHcrzLY0jAIiuqVMf+D7s="
								"2": "koRDCAyXVviRnHaqsKPMHq2x5yzJG75/iskyym2i0G0="
								"3": "+slpschtCNyDWeU1nFuFXZz3CtK57nxUjB9z8eSSB74="
								"4": "hvRxr5pgmdlmJ/WCR2yHuSzm10sUqtR8cY7wY29UKOE="
								"5": "ukwFMV3qLY3kHOwU1ZHV21iM98d6dHGfdkD3q8amTh4="
								"6": "m7hyVvjUFFRLxgGq7IsT7oTyczgd3AAlZe8nL2MBUa4="
							}
							multi_step: {
								hash:       "CE2UKAILK88Q55QOVK902GMKIR10T2MONP5J78BRIHIT7M05B690===="
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
