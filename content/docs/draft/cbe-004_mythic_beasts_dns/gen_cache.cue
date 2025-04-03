package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "JvbbFjqCC14ABS+meyAbvCNVpgqYvU2WoQ2s+2BEACI="
								"2": "TSmnMNdBJCuqDSe/o5Yr2ocERbadFyfeCgmrOnKotvo="
								"3": "dZGMOxmN+zTENB8Ame/pJurxhguZ8fMWPw2R2W7esrQ="
								"4": "bOaIYjZCgBLOyJcpzrTFy0Vzjwu+bL6jR570cv7gb/w="
								"5": "DUjUcs0IrTdDAtk7DdSPVULI546lprSxOr0DZwMNOcU="
								"6": "TViRbMA8G/LPKtV+433/TWb8t4BYCk3gMrtLvhzLocA="
							}
							multi_step: {
								hash:       "5240IM0236N64VKB2NLE53GSK29T9HF9UMDIU88GCI6V7CDH3U6G===="
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
