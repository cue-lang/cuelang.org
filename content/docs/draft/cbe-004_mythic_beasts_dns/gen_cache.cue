package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "h766IRMXzLtVEQzPQbf4CiZfyVdQUO9kQjOikF1NzvQ="
								"2": "lFBdZ14jN1W02m0dblb6yxhp7gcCsqrmUHbwOHZaOck="
								"3": "vZfUOBS4aUJPCMP0ctR7/hDRlgpihuDBxIPcq9brtak="
								"4": "iyDeraGFMYxVMMCe9AIgurAvGpCg9UFn6xRe/xe2NX4="
								"5": "D0q45GeDDl7nqqqih+YqG3y2hBpsA78RpfsVtrMY/68="
								"6": "e+Pigx8LrqmI8kGShVK03ij3YUB67pOTK0LzVamDwy0="
							}
							multi_step: {
								hash:       "HE76TII4ANSD0A3194QJ7KNEOG4121JMJLTIJ0AFM48KVHFSON10===="
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
