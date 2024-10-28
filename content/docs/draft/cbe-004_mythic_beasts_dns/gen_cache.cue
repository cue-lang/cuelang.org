package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "e/giD/9JZ/8pyYFTDSyZds4kL64Z5r+vJ8ie0QbuClw="
								"2": "vc71UO9RG+HNWvWbm440pi+CaVJ0fpkZa7ftDhTXRNQ="
								"3": "0PQRO+Wk4SivSuizeGNwH1mrY2QJr2qdZt6jTpYes0E="
								"4": "S5BqkXZLhynGCgcnHi0RoKfnUu4RkHrT7zcbc1rpJxE="
								"5": "+zXQo/MJlGFRj5Ryx5UqA/818uMPO6BzjNvBHJH9/Ps="
								"6": "4msR3iMzE/hXWtUugffxA61QAVLdIAoAXzWlcEo+vuc="
							}
							multi_step: {
								hash:       "6AUM1NFT6245E6S55TB9DV378HODO0LT5UQ1KH2M7DID3SH4KL30===="
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
