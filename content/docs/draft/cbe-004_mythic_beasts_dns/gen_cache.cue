package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "cMOnEVlc1f7e8kEHUVsCohGFAHBlieWboeeUX26oJrQ="
								"2": "hfyamfVajzG1Ow0kVxmANQaFdrTyynwuLeHm/ZtbW1s="
								"3": "2wu0fQl5CkmzcoHt5xC+SXty+Ba/rT8p8KNupx/uFyQ="
								"4": "59lxF1P5Tv9ZUkt25HOAsMU7XR0Jx2x3F62UrVHxkH4="
								"5": "SgaNlgdNI2OQFpREUkCYIrdxlnT9GvadPJG0b/dT4/U="
								"6": "GKG2y+HT2rDn2Oa7JIP9TzxgwY6VWS3DODwJjDUQapU="
							}
							multi_step: {
								hash:       "6600NFTMRQI5QT460UC1IHHL5AQ2AEIMD06D2QO9AP0URBFMJEJG===="
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
