package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "8bymGAfhrFMIOlVwyAbZb6qN3JSufq5FpuBfZgYD6hg="
								"2": "pEx7Kf3Gfu0k/vrG5TMpAoi9PSRdgF3a/IlTPyvya+k="
								"3": "4sHaM7tu4RKfa2uLEBHDgC4m+X6iHSmFV45hStB28JA="
								"4": "yU8Ei29qFDC05+YrxYidTApRGdAqRbZIgI2iKBKAsmc="
								"5": "3Cvkm4MkqA4o8I6SHVZE9XN5rnb/R4rPDc1S4pjxujQ="
								"6": "c32IFrtUYCnN0bvLHN86/FJXIh5IeIvJ7sXsGDaTfPo="
							}
							multi_step: {
								hash:       "KF70L8LL8M3IBVCH7O910JHALNLOQNM9VVAO897CSO82PL9I6M8G===="
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
