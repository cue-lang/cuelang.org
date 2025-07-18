package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "GBbAx0CxuXvO1ZgaU+eV5EBb6ZeeKMO3RnuJZ67rELc="
								"2": "K4YtmYakTyQqnT6R8YrgxJzx2MJZnCOuYjFFhb/38es="
								"3": "PxVw3GYBP84eQg1ttP661khPPfpWFZpYnm351jaOphI="
								"4": "+CaivV8QG4UOqo+aTvKjuDBkzjljVQZlNES0QMrN2OA="
								"5": "4rKo785ivKRYGa/gMdPxXVrk8PJdtzYBefbD+KrIOKo="
								"6": "Pkst5bcKGLc0JkdcXJYsyn/UiIgezBFsWvM4a1VdrZ0="
							}
							multi_step: {
								hash:       "OQA1I84RCVI0FLU1LMBTHLQSB0K7KEODPRI7P1SOEBL9A13S9OE0===="
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
