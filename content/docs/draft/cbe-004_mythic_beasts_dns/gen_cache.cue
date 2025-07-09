package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "VclmwsOVxugDV36eEhQx8JTzPImsVKctf2cLQz92Sf4="
								"2": "YkCoQCJcp2ANbp0WYWNYDvMbZ1KxkbqS4NmwHwPQuvo="
								"3": "2LwhcFZLVpChVzQXuNF78M50YcWSmwJeyArWBYVZ1zg="
								"4": "Ksk2HzehElfV1xQ12zSXY8JpzjGTz5upkAe7K1h/X7I="
								"5": "W3amKW6RT/fAm+KzsY+rlD3wGwqAidZOEnpLsrA7rNE="
								"6": "WR4dEnmSrJM+5H4SsNjMo47qmB6UlYaAxZ+FbCk//mo="
							}
							multi_step: {
								hash:       "HSHMPLME9SV6K4VT79QLV4CIPOIR7S6ALO1JETAFVDTAKMUV2QJG===="
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
