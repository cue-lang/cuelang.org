package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "TDCOpWAN3zL6u5XI/3US4/pejGHgDwTOfKN9uJWzjHo="
								"2": "egc4OSjeojP5VXZsBDa4i+6Od0pueS9BY+EkiHToW3Q="
								"3": "UaBrgwLIToaeBFNJtdMwUi1EZGp2ZzAvrVFamdHdpQw="
								"4": "gK3Fxgf0Xo4zB2GiRolmIYcB2Hwaam/2CuuXLgtZmpg="
								"5": "MQ2oY9ym6FFgzSJvPOmRPI6QXnfFRoQLh9+qledgdGk="
								"6": "Ga7xyXZCpD/Wcss9kcHQk84fzAxfPfszW/nqT4FbsKw="
							}
							multi_step: {
								hash:       "MNM7HEI7AUK1LM2FIJH1CF11LQJ8F7A1K9H1C7456T7KED58IV1G===="
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
