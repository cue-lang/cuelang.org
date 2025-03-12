package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "WoFrj6TdeHd1KMZaLlAO8hHqVhgvGQyzeQmgOOd/mYQ="
								"2": "OZvbms0/eozH7J98lrRI6Aw93tyiYM7EvJa8IFBykYQ="
								"3": "fsnytimt8gXol/L+dLHFE+xpPjL+dr95Hwyh8PZOi7Y="
								"4": "iO8MIzLD6ZQSnzTf1Nv9gojvCBv/ILIY9+xjt0sn7gg="
								"5": "hsVhgmaymcGT3VUd8djmgO4W1PoQ+VRDjx+EzSR+1WQ="
								"6": "hLKI4wlQeiQEqoHYMw0ZzkHVCFWHq+J88ghQxQw/ePs="
							}
							multi_step: {
								hash:       "FJAANQ0R41BLSVHGOIM2MPE97FBIB1LVC2BU78562HCOHEE32CR0===="
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
