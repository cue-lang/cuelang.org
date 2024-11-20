package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "J8pHNbF1a6KE/hBuIPNzseCdwYh3CsbXnmtR7wb4G1A="
								"2": "IOcE/4SVmj7Q0R9W3nWgDfTYhcg/WfSjJ8r5jPbAuKM="
								"3": "VKdtHvtKB77FJ+eZLco62Onh23gC26ux6x124hF6z6Q="
								"4": "ADgG17YIPOSjuI5sYYIL+3BhsGpsV4BwvymvpKMY9sc="
								"5": "N4a54rssWtUnZkV/IDrdT5rljMnzz/8+WVOav5jPDfk="
								"6": "8okNNx80rkemmMNa1aCczg5emcqWVvjGMei2kFSPOgE="
							}
							multi_step: {
								hash:       "BU4U6HGMLK4CEKB55C4KF99COE81PI81L97BJ21DT0E3GCUACNBG===="
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
