package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "E+DTOsGj7CUlDnrtgOmsQk3BpkoecMx4m8r7ygCjYg0="
								"2": "PyGnUGupXAAmk66+mkQkYvePO4ZtPymocSthU2WHJlE="
								"3": "GNRNZwQ4Z8YjetHna1hT4wST2qaYFeOL8Z9ljK3/9xU="
								"4": "Q4FU7He+b33F3g1UlPN9lReJxSN5G5Yl0zUCyM1gcWk="
								"5": "M3/fEv285FcWhv16x0y+JTlTs3ZWjYFYBrjZ6CQwZro="
								"6": "AIBIq0VmXx4uNV8mAWT1Q7OipaJv4QMiTumZDBGgt1I="
							}
							multi_step: {
								hash:       "G4B7MM4Q1UU9DS4UQE62SDD5S2EEOS93RTRVPV05L57UB53VVQ00===="
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
