package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "4F/BgGvlUKNQ+LRStrvb7A+mt5AsgdxOCuJtq9Su1rE="
								"2": "LSiv9Bii1DS2tTF/wdrUbPX3JhTokb/HEopXEbV/3fE="
								"3": "xKCzk7m0E4n8q6Trt+eGL3Vzx9x4EpTvTUNHfvQA/wc="
								"4": "jJCBDffS8u+dPRgUEZr/5idNQoIJ9PWTAqiKgQIebcw="
								"5": "LLTwYSdgN5KHVUIfZP3LUWNhaVzEk0Ew7rNTAESt0DQ="
								"6": "wsncHmXZlQaFs8e/BPe3+eOrEmwtmllj0oQqyTAEYQ0="
							}
							multi_step: {
								hash:       "BRNTJDKNVVL1LGLV6V3M1CE6IEHPNIKC39R35P03RDG94GTF0GPG===="
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
