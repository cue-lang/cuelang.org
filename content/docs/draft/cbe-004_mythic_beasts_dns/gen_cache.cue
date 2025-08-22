package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IQzPGfDZogize38ydlguC7loYUpzPf5l/iWHhJdPoyQ="
								"2": "NqybN6ALGCAlHlfTEqZdJZrLJlXHP23/SEyfjdWITr4="
								"3": "ltvin6CnS2JvjNvKjJotz7phU307DEVOe8a6OmQ/sTA="
								"4": "2eonV5qRRbErw2ycPU/K1lepAp0Xll8d+3S5PMpKFoM="
								"5": "nRAopg1gqZrzasyOLvBxyad4s2sJCi892Zg3XlbxnY0="
								"6": "Wu0hXOn2KZAMAkbg7w2x2b6NOcaUEo/Xq3sByQzM2iU="
							}
							multi_step: {
								hash:       "QJLHLTRAFE4GRGIJ4SDIV2VOSUS4L8AUGAB2SNN5S1ADKNQJGR1G===="
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
