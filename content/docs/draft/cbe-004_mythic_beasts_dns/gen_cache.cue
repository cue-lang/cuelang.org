package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "9ptt9CVjFVpEwwoHBrLzwduPe3ZDmtFes9RVvpckb5c="
								"2": "CVuKDzaIrSqTjvJIdyLuBrfHaZxX6TwtIDUlovHB2Xs="
								"3": "cCf/Fi9kjSVHz9yVB0IaPj1hV6qFa8eCUaAFZrNKyps="
								"4": "sHv6mAgQ+DHbgnI107//XtPGhS6u7XqOkmfJNqq2KfA="
								"5": "S/l+B5XRaVm0QsE/UAff0KBe440ceIis8uRU8w8de7g="
								"6": "q8gKXD1NPHsK6gxvNG2f4aLMvmCe75CMaXXda673xes="
							}
							multi_step: {
								hash:       "N07CARITFDHSNF251OFJBRUMPFDLTSS3LT7RF69HJ7IBA99S4B3G===="
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
