package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "vCiWjlFiitWpmQvTX2/CLkOkg2nlIw7rYgiggiC+NvU="
								"2": "eW7OgsSSkDMPYETyiisVI6nhKNqapIVt1OrM+gkrrm4="
								"3": "24PJZzUsbecHmsdLvLHq4srUdjqFtxJOkgFrKinOqjs="
								"4": "JCuWBuhFcYqwhO32eVjDZKamNFk5VSppHTCZj7ajK2g="
								"5": "l1NJjA3Sd03ls8yGOqYSaTW3GnRIKxKmQ3pMsL+8URc="
								"6": "v4kVmUsWUnIvAPubGHk5kY1DUd6WxJJEbQGtOaCJOZg="
							}
							multi_step: {
								hash:       "B0OSC0Q0SRQSK65S28U7HS0HJA8RR2R1MP1R31UDKMQOD59M5FGG===="
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
