package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "sRDdLFtQwMIYVTM0ymYHRglFMdrDs/JkYKr0zV3C/5w="
								"2": "q236v23TlhYQ1yQGsS8qZSJYqn3HipuzFQy5l9wMXZ0="
								"3": "D8sYd+Sl5i8vQhtny71o4/aEYjZAwLeIIupFtRk1yeI="
								"4": "FtUZ70Xv6p2uRZ2Q7igFLvNrTrQfgtNu2CfUncuX+kg="
								"5": "SJlUck6LkIHtDqHy7iB2RIx4RPbG6PhIpNwgjRyHR20="
								"6": "eMiVoXce0vHCUE/4M95+GTp4M5F6MFANVifGScAMH4w="
							}
							multi_step: {
								hash:       "19KLL1M2EJSR19K41UPI1Q629312Q6C44BGK7TE5VD05O1V21NMG===="
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
