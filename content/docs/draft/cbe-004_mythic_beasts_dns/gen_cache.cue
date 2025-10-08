package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "20RPWphTD4FKi6zvnkHkuMT8IQFen5tY68HeOZmhfqs="
								"2": "5mfJaEYpoCCW/vZLbiuOAAnIdzwu829fHKyGi2p/DPk="
								"3": "E/D9miM2KQ5sw0OO3XubX4MCyjWYz4rvZAGYbQ9kTeU="
								"4": "BIGQYnBY36cF0x5v14SmWHCys319v7LKmhigqikMMHA="
								"5": "Iw7hQ9i9e5+MwZuiJCkCGIyyO1ZPFJndVBJl2GEYFr8="
								"6": "RrKsG+7lLY1S/hztl8Zr6FKJLm/diMQ/ExWrOZm8mMc="
							}
							multi_step: {
								hash:       "42RSJ2RFQ4REH4K5Q06OI5LL4T0BUMQK7683836TUDELNHQFC3VG===="
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
