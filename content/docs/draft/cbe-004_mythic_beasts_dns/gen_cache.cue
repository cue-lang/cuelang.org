package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Y8osSJf5aAP2qJHL1nI0/Wz+glLrocsqTTG6p0McsOE="
								"2": "yReJm9XLG+4WZuXZd0NqIDVHT6ai/9Uy6fbx6iLOYKs="
								"3": "EaQJmCyzk+s+GaeCx2wL4s+StS2oBD828X17CnI5Puw="
								"4": "cOD+mVPX2K2fccOc/UMhqqHsBK72GlJBVXTwNI0Hdi8="
								"5": "7taPkrHuLEXkjY2GzuuwvYBmDOG+9uOjmawWKm+gte8="
								"6": "fqFl2PI0F1QhDrKracUh9AVW3M7RkrKORL0CeJmXEp0="
							}
							multi_step: {
								hash:       "91KFFUPK9EA1NAINJRCKG8P8PA0C6VQ8VFD051S8U4CI3D43A7OG===="
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
