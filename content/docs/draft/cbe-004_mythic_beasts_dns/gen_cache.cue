package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "r4KDroDEcJ45Wf7QzucCB3ONjYNLOgFpMYF2mXwEXE8="
								"2": "143H1eyPpfLKGkkwnCGMqm/7pvYH8WyuBjhL6rhWvj4="
								"3": "KiYEA3Jm0kZcet3g3OPGH2FqCWi81tafgr0B+zJMS0s="
								"4": "gt1YH27W5TSBMSmK+fIT6t3AlBqe7qW3aEpJp1hHSuI="
								"5": "hEl6dSfs+YyoYFEs+5lfMbzGYK6QnTl5TDqzo3gBIto="
								"6": "uhO4rpn5hlM4Rgsr0Z38NCPfEMr5IQc1Bc/YFnkqDmk="
							}
							multi_step: {
								hash:       "L8R81N0CS1754VLN6FJU869A57HV528R1M57E2AB9MUKHT0HGNKG===="
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
