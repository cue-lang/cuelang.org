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
								"4": "oKCtrNmh8rvdN574qjE50Hr2r7KMHtGaSCNbdxVerAU="
								"5": "wLoMDxx/rU0NZmh2YWHTwP4mexMx66y8kZaKbcXyFOQ="
								"6": "1WRDCbejTNODsK/eUG/I1LJNQwjqPGsFxAXOBpLAP3Q="
							}
							multi_step: {
								hash:       "34QHG3EK6SLSLKGMRD0PLD9GJBQQ68REUVPN7KT1HKOBGC3EDC70===="
								scriptHash: "TBSD7E08FTER7Q7L3RJVPMEI6TPH95PCHEEJ47GV2E8D69I7L7DG===="
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
