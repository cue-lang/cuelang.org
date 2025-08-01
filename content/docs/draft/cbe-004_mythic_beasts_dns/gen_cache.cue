package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Xf5PkRhJMmWZWvsOaBWYIrSlZYmPIun5nldeLY7X4xY="
								"2": "o12a5ToCCWBKO+bp0XRZ4CvkMSHs7ffDOZuHNw1MnTI="
								"3": "ErghnHRu1d6WaBmQ7frUFNsp1RYOr08qilku/wRZp9Q="
								"4": "w2Uv9WzqKfIa0hqU6LBmfBsX47H3iOi/jAlMNoj+HeA="
								"5": "OrreAN2HEX071Wj741e7rPzjyrSeHWHxm1mZ8+ed4qg="
								"6": "i/DA5qNsh7tpusyaTchUs6Z4GN0oPNVzdxneJFko3MY="
							}
							multi_step: {
								hash:       "RO8B838RG5PGDU60PHTMLKMPRSOE4CEIORPU2JRJ4GC5CAMUV73G===="
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
