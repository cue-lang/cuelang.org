package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "oBlnigHWZIiLoaDnhrtNDi8FHsTWFT05Dxa3YoRlIZc="
								"2": "z8F24JPYLE8I9/QP1mhFR/PYNnrYBGpZeXAQapqdVkQ="
								"3": "5uEIYWfSpV0tHum/ommYwzWOs/tzmck0rCSJAzPAZf4="
								"4": "sd1TBbQfJK0uFb9J3Lppyqo3qLNm5Zrv4fGDVtZEbcY="
								"5": "wy1v7jP6sRxVdJ1o1npYqQJrKoQ5zIL3O7Blo2mCKgI="
								"6": "HNS5N7Sb7Lxmyok6uIGDRmnx9qpqJ+/FaS32DA59xyA="
							}
							multi_step: {
								hash:       "V1H2H9Q4RHHJK1FB27H6MIJGNFR7KB1PO1DFNQ9BANST4VS9R7N0===="
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
