package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "iHCEkKmGHCW72ZRW711c94lAfbNgEFHnX29M462zci4="
								"2": "2QttK2EGSWYrWtuRB8xF5Zqz45xB2NxxoPOH3vY+4mU="
								"3": "4dN4wmAiIZiECwd1/QZGM8UCwWd2IWOlY/Xp98cxqZk="
								"4": "YC1nE5ES8zPapm9gOlDC1+nViuQP+F3dUbyv+vDVnb4="
								"5": "eggoKJjvCvnaFLuO68RvDA2XFWxhk6Vn9MELZ7kENvA="
								"6": "flFAj6fP8DNPhoUoKU/yHEEjUOMIypTqB2xH+v4GV+I="
							}
							multi_step: {
								hash:       "LT4QJ30K3KEGRONJVPGCJ7KU4R8CROCIT533INE9JNHR97KODDJG===="
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
