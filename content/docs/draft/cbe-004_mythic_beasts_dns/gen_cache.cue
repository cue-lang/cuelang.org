package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IetrwRGPztOGQJYsfghQUVKT3SryuTpLtyu3YMB9NMg="
								"2": "bzrxpuIaPLKwBZ8UQmm7KImo+bT4yWu8HdKWWo8Xggo="
								"3": "XXdoh7DByWh7oYZaeOjh1cHXtir9q4S8JfKG/Cb2ZQ0="
								"4": "Zb1SzESCjGo2SXXZLghq5sEiy1fYz+uDAWGLdq7AknM="
								"5": "vPj8RG4BNOpzklRp3czw9YdxVsa4IeSzlATusAHCSMw="
								"6": "k9gL6t8uksJfCsQX/WST2+VBSM3zxKP+WBHYG0nuLyk="
							}
							multi_step: {
								hash:       "09RJGDHF4FFU1TJHT0QG4FLUR4U6EA5F1NCA2FN6GCIHCQJPVLMG===="
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
