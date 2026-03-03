package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "pvqervXZ9aCtQNvd7KBdAXDZWp3PXA5EXeyJsTCDp0A="
								"2": "1bhNpVZORt9uNjqWiuFEiZ824wSWWT8ImR5jcowTZzY="
								"3": "2dsrE8fMcfRSc6dIY11GGhe5/6fdM0nSk4GrJ6l0xh8="
								"4": "cF3Bl72WBaN49ztKWwvA19Y3pF784xsJjPvbdqFa3GU="
								"5": "wLoMDxx/rU0NZmh2YWHTwP4mexMx66y8kZaKbcXyFOQ="
								"6": "1WRDCbejTNODsK/eUG/I1LJNQwjqPGsFxAXOBpLAP3Q="
							}
							multi_step: {
								hash:       "5P470FLLTMENFURLU8TGRA3BFM4TP23D799MDU8DUA8A5SMHAMGG===="
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
