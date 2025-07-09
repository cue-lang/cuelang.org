package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "TYvPElt5Di7b+i25FE/2dEsuL3Li3RqEzv1Azj3y4Xg="
								"2": "7C8wIZ9ELJFWXafV4Z9WA+wJi+uLGEvxbg9iO2S0ruA="
								"3": "3cBFMq3dJvCz9j+Fc6/K/WEjoEdSmeiy90qUtxL0Qq4="
								"4": "NpiCGs6+kT6t+7qYVsL3nHHFG+p0DgYzRPYAuqeDuyM="
								"5": "NkJwcdWPvfLN4ocn1QwLCM9WF5QWsUH7gx+xL077Ouk="
								"6": "2zcLGcb6g3tXMXnoXyNrXzfT8EOS8qhoSuk73r/mblk="
							}
							multi_step: {
								hash:       "P5VSKSCTKB6AS4KPGTV7HUK6KOD4NDVU2HTGNH24JB3HA44S9MUG===="
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
