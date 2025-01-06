package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "wPhy3I3JxJc2BoQfY1yMOf77FZkwXnepotUjIG+iX1Q="
								"2": "wrYJDMOAmfESIvgjiM1iNqCUPZ6uCc81Pp36rOGUecg="
								"3": "JeaWTXaqcmxZkTQhmofCz9yBrD5UfXZwlN7rFMAE9g4="
								"4": "MILrLbhIeggGib4hYShg6y4gMHsHtjcw5HvtWnAeWxI="
								"5": "ImzdedssPb5WCbVtOcHePIWkehnu7Du3KS49XKizZcA="
								"6": "yAWdiNynPCuqJd5ToUyrD5wl1hu9wrVTtbY6j7C2y6o="
							}
							multi_step: {
								hash:       "HD7VKI71TMO1GN1IQTF51722BMFS1LCCNBUMD7ST32BIRGV1JBL0===="
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
