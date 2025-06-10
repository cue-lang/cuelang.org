package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "CLv+TvFu9SHkD1wmDeehAU42n0BzD0LK17f0yw/LcJQ="
								"2": "FixgvYulLC6AM6tpCt01lJWSvLR/K7NzOFoBeoOwzxo="
								"3": "zofpvPq28bdSDSTp5xFUcUHyFX8X0saDvyTcmsz7qic="
								"4": "Q7Lhzl/8C4j5fWC89TuD5fojaC8+d1zC2b8i+KSc7i4="
								"5": "ZXmb/xTPxaJYj7WGUe/oIF1aFFl52RejsjJKesWBI/M="
								"6": "+ws7+zvW7OqEimiMZA+EV1IOe33C2oHQWhtysT9Cxjc="
							}
							multi_step: {
								hash:       "P91BPUEAQ3S35PTJK7G8DJ706SMICSBKIQ7PTOU2M7KMCSGDUC1G===="
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
