package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "JrnbQGdt9Xb4UBx5DfObPuApvxAzpUM5+bEPD1HTp/g="
								"2": "/3JWmDfFASSRa/Bcx/xYj4FgTB2OZ+A8VQ/DYOINLd4="
								"3": "RgMVYgitiQHYUZH6yVcey4xLRYFyfTbEo1jd1BKlJR0="
								"4": "P4fsRGXFuvELx/Jkpb2qgpCcKpK0KyV/oopfPrTDXug="
								"5": "wi2IMISSu8r2jkTzM4yUOODB1eBk3Wa0fUobA1NQKyk="
								"6": "92EOH+z2V+/CdmvppyeLkAIo8YdULUSSfns4WsdF0rI="
							}
							multi_step: {
								hash:       "ML07N56LELGG3UV0L02OI9QN76VCG742LRPI089QM5ELFQBHHUCG===="
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
