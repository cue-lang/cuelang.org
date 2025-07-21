package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "el2sCqOXA7jog9bbsxArgiAUt0GP+eiSoUyL7luv2Zs="
								"2": "IFphFRMPdnkxqkHvz7l7f3/BJh9RRzpD5GWQdV2vU4M="
								"3": "fd1bQCfAQ3lKdlEUOvSllLUpQUQpW1pMh3yOs3NB+KU="
								"4": "dWerowxE71Hhn6o+kipxSuB7J6Qq0S2aG+yLTTF9ahU="
								"5": "So877F/Sgk7Qa5VBAufr+j5H6U1ubEIYhX2T5oTOvNY="
								"6": "OEciBEG2okAdIR6l2mabRCbiyzd5RTyrI9SgA2tgGAQ="
							}
							multi_step: {
								hash:       "G9I7L1BC1CEVCDA90D8ANSFLFQG071222Q3RLHTBMLJ15K63R9UG===="
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
