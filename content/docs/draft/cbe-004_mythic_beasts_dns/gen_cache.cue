package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IOa6VDs2Lj+c1J7t97eOGjyTQDEw66OrcKzgeOB2du0="
								"2": "R42dNCEZXe+nanwkUn41zctmRI0uCgSvc38lTUy/IP8="
								"3": "iUEUma3Rwvy1fDrZe8dRiOJftdOWmCe3T9Gks3xwYvA="
								"4": "Du/A6MJkURiFyu/dGYpi+6NBA4+MygqYokbqIaQSpCw="
								"5": "P9fjS2vgvUvVTt125ifdXBktMHbMZN2FLYX5hRHpItw="
								"6": "uHVePGV/P/d+SenLi/vb+jJPkoo+LFwhP2P3YcXXoG4="
							}
							multi_step: {
								hash:       "09JGKFL2239VRLG7CEIALI5D8315O5R1U72963OSPC1FO51RF5F0===="
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
