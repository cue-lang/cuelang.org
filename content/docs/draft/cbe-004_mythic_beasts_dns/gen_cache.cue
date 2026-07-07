package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "1IoFjCvcY11kizQWBabNOLvhQUoBDsQF44ejcP+51zo="
								"2": "4JGzSHNVEMORnTjd5WXnsKwnJnY/Qj6r6JDzK5DSb6A="
								"3": "5L3Wp9A7mNngzZ3wGOyA8MS3JiQga9OR1OPBin6febM="
								"4": "0gFW4grlMVadpPHA8fAmCj9dXGU1Sh9Ab0tBfZhFMWY="
								"5": "8O0gNuPR8QfgZBkAqIO3quPbMowj8L8Vref3E5oqfHY="
								"6": "DGXOWkFioPhYFE+sndkNb1WksYzbmD/honMe1jIePd8="
							}
							multi_step: {
								hash:       "TR3LGURIIKAA3T3H87QAVI5OP7P11O8E2B13D57NV5F9MJJ9LI40===="
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
