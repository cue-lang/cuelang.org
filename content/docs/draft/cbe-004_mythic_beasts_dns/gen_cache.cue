package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "PM5YnlikUXSkTnU7AGjwus1pCNah0DLAh+j603pBVAQ="
								"2": "Pm4k5EDNnXyKgigVn8OeSM2X/oVqupyvKzuxYUoQSDI="
								"3": "f/RfLvnllc8ecZOBmtmNatv+kRqjikS/2Co+0ZMFu9c="
								"4": "ocW/Q5VQwkICfpnoJMgK7YvYfcct1bUStAioj3RgflM="
								"5": "bZ6jXeOAj17mkKcl4fjg5vQu1QCTSubKCztDnkqGipA="
								"6": "z/4tZa8ZLpRKFlQrkTjQOPgH8Sbx0bTwJPKPt+tMNoQ="
							}
							multi_step: {
								hash:       "2CG2VS6U2QLHRKSM2GHHA6GKRE8P0AH1Q4G56UK1IMD05CMVN2FG===="
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
