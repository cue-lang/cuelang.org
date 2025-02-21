package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "1x47vW/la/Jrb+bNXS5G+awcKD0C+m/p8x8F3IqcbKU="
								"2": "JrDDtN9HQ3FBcWwL4C8LimypCXCekZe/BFdJMuYu9oA="
								"3": "IjD/ljEGgUpyaiQ7JlZM4WZJvvn/7lIm8h01uCryrxk="
								"4": "e3pX/ODbHI7JVVCJUNMcnDJ6S1BrhQ+Jrtqk3AelL5I="
								"5": "zOOIMw2lMtNyiN9N9WPCX0Tkw7CrKN9W0kYxHVHrGf4="
								"6": "7PPvOeFiZ03Xq1Hufk/0LS0iSufAE9LHSxNriYiFLWQ="
							}
							multi_step: {
								hash:       "P0F07OVC7D571CU50ODGEA7BJECLA3DTL3GFJI24QK9L9067K4E0===="
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
