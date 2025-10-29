package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "f6xBHLjV/GfMUdNc1hlGkPzg0bGDwwH8O6VxvlmysQc="
								"2": "xF9Hzd1g3MsMjZio7dR0vkVu2hRBWTqpBdNYajn36R4="
								"3": "8heZFkjF3qt63sYKswufVOEtyOWk40mysJNqeD44Itk="
								"4": "p0/7Rs8AZkR76pDgNBibjX5tspEYUojCVa/wcqXkXbA="
								"5": "NHdcOKY1IIV54eDkfrG8C7EOmrM7akn3hYjzagGF01w="
								"6": "3Sc6sbc/PuyKRNjEqFFO21Gshe5XH2S44CRMhoA90lo="
							}
							multi_step: {
								hash:       "J46HU1NI54CNH3TR6A868KVU2FU1RU405PGDFMJC08UROJHOJESG===="
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
