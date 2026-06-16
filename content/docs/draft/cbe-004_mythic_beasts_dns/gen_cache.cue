package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "/aE4oJD8dEudtEd9GZ+aN2xLfWi7xL0fsZVAutY5PQw="
								"2": "Dein++katiIZEWkCcOTof5GSioNwdgXMhnZCySo2eh8="
								"3": "NaqaDLlNuSjJwkWfVBKKWotvWAybU+mx1CtK9rzErGk="
								"4": "B58BAuueGOKpmORYHUuRnBeTkA7oIqgt3MsfPqnrWQY="
								"5": "fO8z2BB1HgIBtfCoMsznPcD+Rci9zDOCfPxMdBoLKko="
								"6": "McfvFNnSwoMLESr2VXS73XHwUCABsLvYlEYO9sF6CoQ="
							}
							multi_step: {
								hash:       "8M72CVCS7CFC4AKHMK1LR1D53B7TGM8HDKB7VF41A5UB1MUPUM50===="
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
