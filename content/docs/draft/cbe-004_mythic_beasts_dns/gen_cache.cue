package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "6Law3wtSRHIi8l7BPgjx5IhO6NbvHBQUnWUfcxArhUs="
								"2": "XodeMUmKv8yLsnzb4KYp426PqxJy4y1QeLY2e19iGIU="
								"3": "U/fBXMmWL9EOpC+rcMxIvbZpgmqzbfYh0zTSqDmvTjQ="
								"4": "z+1AMCyewgGpmiG1y3E87TxyZsnGsmYsSH+ut2GdN6E="
								"5": "0eGhyOOFS5lil5lN5CmiwDCXeLC2DUHpK6voWD8EvCQ="
								"6": "HZextWST0pQ7FmgOQRbrnoTTUBots5gjIq0LFX+UD88="
							}
							multi_step: {
								hash:       "5QNBU4AV1GH22V66ATGQSR5968DVI3VL9LR77IGOIO5LJ5SGBDKG===="
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
