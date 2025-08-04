package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "9eaSb4ahsPdZSco1vOFWHCle/urEt3sq6eQVhgbI+og="
								"2": "Xd/xWkq1qcW2Z6oSzMsb/LgQIgpPFKCImvzhHlmUoW4="
								"3": "7TS4VkzV4MtygOkWexS7t7v713kOXU8vPHOClCg2bpM="
								"4": "rF7IJ8GvL83tVpNyaUKTlprKwYByIXhh/Z/dejMsbaY="
								"5": "52894/FsNtEMWWYzgBAN8Oupzq8JNJt/1I4BsAokZ+o="
								"6": "BfM2aCd8D0fPlNLF07GmlLSyc2dz+hNfrqvBjEL4B5Q="
							}
							multi_step: {
								hash:       "B9LAVHL3I1RBL7DF4MSD1C2IUUF1PNCRUOS2TA27902ICTK9H850===="
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
