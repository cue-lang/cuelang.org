package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "NOKE5Zgb5WropiX++VFfCTKJbw+K/W9M+URt0XNoV/c="
								"2": "C422rtVfqTApANCfXtjjYRUZyaazH7sPKf31w2Dpe5s="
								"3": "MUPCmwDLye7HMcn0ba0tiOvLbphMhPIwmJGvX+e7hSM="
								"4": "z489rRQeuETX5lplkAAJamMBmB5nx8GAbixuDTmKxMk="
								"5": "DdTE9KhSUgLXG+YhHlM/hg2yjf9GyZ7JJj3gOUoszPg="
								"6": "NpT/F3meQJU25ipHm284EvWpGUsBKjTFQo6zNEqsy5w="
							}
							multi_step: {
								hash:       "J7E367330NHSP3SG6AR103I69IEBGCEHLTJ73MULDI5H24SL0SCG===="
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
