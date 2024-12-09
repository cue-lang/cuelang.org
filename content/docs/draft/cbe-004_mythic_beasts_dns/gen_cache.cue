package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "UPQQu/Sl7qwiwTnLQImG3G/p1HAQbYfItcD9jJY7aE0="
								"2": "MMu22GbKZmixSfdyE4roH+z9IiGR2nZWVcwQ8zvnY28="
								"3": "Rxr1iamCOUF032BsGJDf2fh2k48rm/v7ynuLsoFUlBo="
								"4": "YnLDuy9xXsUA3EUsroHYtr/Cg1jfwSFJ19aty6rICKo="
								"5": "PVTfkSNf2H4bUBKAyGoSBuBTsHc2Bevf0Epj0fuJL7A="
								"6": "Q06wp9ffMpnXdarle2DFOStmIu98T++ottlFmA2mJzA="
							}
							multi_step: {
								hash:       "618K5INE49MC0KFUK6U48L9TCLE0F1U3PGD01AJ3443K31IDPSV0===="
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
