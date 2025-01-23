package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "UbxwlLXSVkwTdui4aJD4xL2W2EKbROzvGG09Mja96Gs="
								"2": "Oc9rqiBhcY1MgV7G3+0PTrk5oRKJfQMBeRGqEMGRJeQ="
								"3": "wFDjSKxr8mqq87r171g4IJVATG8r0/mVFEM+49t7olw="
								"4": "JYzk98163W/qY7wiDGY8YWCx0R/yZwVLYG/vTuTD0CU="
								"5": "SN7aQ2ZVwkZboU/d1M2VnusJIzmeeQuaRo2L3fEJUKg="
								"6": "wXn/yP3aTlTmUDmCm28OLBfWCwHJZb0zOltcc7M+Ib0="
							}
							multi_step: {
								hash:       "13IKCUFR7PR1UCDIS959UA90TBREVQSF6I5C6F0VLA8IL7DOVL2G===="
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
