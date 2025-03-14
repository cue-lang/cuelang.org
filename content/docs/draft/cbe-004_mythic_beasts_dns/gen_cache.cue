package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "5TV41bVZBXvwctBo4eWWFvUnO+2ZhtenKj0H3tOHeiQ="
								"2": "TKYrLHzC7RaTfUXEBHzj28uOtduYhLaSxquV4+KRwEo="
								"3": "mCXizFNyXJcWR0FuNWBn2QRHZ1pTOzmd4+KOKcznONE="
								"4": "NH8njNymji67y5G0elkyRVyIGEEd4d83fX22ahdqXgc="
								"5": "ENDGKyj2mUMuV7c405BJEkBsPt5EMUiNU+LU6zaO9bw="
								"6": "Y6sbJoFRSc08D8M2ROdF/TuFKrSl1zsMm4AY5rVemJE="
							}
							multi_step: {
								hash:       "002JK10IGOMHLKK7IF1V0JE7I2UT5EEEJLLJK38O6GLA6ULTJU60===="
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
