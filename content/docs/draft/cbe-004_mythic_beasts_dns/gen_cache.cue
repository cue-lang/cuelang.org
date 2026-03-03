package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "7mHgV5fMcTR6ER5btf5j32q6RrnHzDYRJ4ycQmDJfAI="
								"2": "S1fqUkPqj3AekSXudszZLZNj77DBB1zArpg4ZseLiYY="
								"3": "RnwtOD0x36wdtrDqAoeSes9BK0Shyd11th6aR/+mNwE="
								"4": "2eXLUG3UsasnT4jV5Y/gljke8cnGSCl1YCsGCykcEwI="
								"5": "pj/8km13Yt1f5QE84Dk/UMj8Bg5S+141P/9dVaArwuU="
								"6": "dZCnDy2kmaMDOayZTR9QVPP+x0uFm/3l24YHLB5GDcE="
							}
							multi_step: {
								hash:       "6VCN49NA4R35PL8SAQE9ILTGO8VA80UTQSQ4DSFVDF8QK7CET4QG===="
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
