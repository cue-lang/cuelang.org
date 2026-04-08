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
								"4": "PF3ac0OmjDSyWcVE2Px0lcnBaHuCyfya55tGBwuf7ws="
								"5": "I4sggoBx5i7fDls/gGwfxKwAai9yTfHWvWi40lW0Eu0="
								"6": "O7zkhdDDmROmqKWnhAcT5Smlyxc5BHOZSzH+sRUq1Nw="
							}
							multi_step: {
								hash:       "R7NSDP0AE432QLQRE3KSEBL0H6QPP6VPVA7JQDHK2EELJULA9N3G===="
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
