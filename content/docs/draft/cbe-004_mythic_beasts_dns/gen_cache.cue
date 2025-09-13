package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "tITayjvycjlysvnivizhY5C6AsXlis26uspJ/I6s4kc="
								"2": "LsbKk0YVwC8GX19pt9E0rr8b6zjla16iDbmLb95Oros="
								"3": "vrly1PKBXtFsakqn7qpcjbSWcf/Ma0su3ociRr8FOso="
								"4": "IoHwtu9t+DyzMkun6rxX0WGn2hJ+FX4hKm1GOxUTeFA="
								"5": "xAPe04/1dEEf7Cmb3osKM05h0N1KjJgI/zi1I5Xd1Xc="
								"6": "OBTMCn9wVFx+xtw7RhQ9uOdhgpTLjBf+GuTtqNKofrQ="
							}
							multi_step: {
								hash:       "62ERT5CU8BBRGFFP74T5L84SVVJKSLTJ33SK244F3T7L471T1690===="
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
