package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "juLRYxvQ6ChZedhKyiBdW33QLF1OZdCU0HmDJExzheo="
								"2": "NteOr0jozKeW1O1A5cRNwdCBItgg6dlze3VL0RmLjj4="
								"3": "DYU0Cik1bKq6vxjJLnnoMtU3DOwcaDNgLVEjvreiUsA="
								"4": "x4OzYFNQtDFoL9RWktMNxd+frrEwVH05k+H11NtrvKg="
								"5": "I4sggoBx5i7fDls/gGwfxKwAai9yTfHWvWi40lW0Eu0="
								"6": "O7zkhdDDmROmqKWnhAcT5Smlyxc5BHOZSzH+sRUq1Nw="
							}
							multi_step: {
								hash:       "9LQULEK3I4HBT3SAQFB7R46OC62849G2RI4D0S3NHK68MKAFBAG0===="
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
