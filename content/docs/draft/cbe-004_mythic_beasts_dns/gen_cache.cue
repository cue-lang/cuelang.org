package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "r0xPcErOA+gHg8CPXFhT7koJFF6Lz+MmszzYTiINX1I="
								"2": "sFunnwrHqnzvxBpW931RqGa5DCCXp4gKRoyIGeaaanY="
								"3": "Wrj5K80FsGpTQYkZUnKuT/6gxUmqeT95JKfdf61k/t8="
								"4": "m4GatQvugnVH5P46h50z/AiYYjDGI6TKEr6Rv8x9XcY="
								"5": "DFaIP06VoCwhJPIxacU+0Ztq53Oz7h+wotv+EaAjj0U="
								"6": "kO7QNrFGcF7yoGYKuJKdhYIyDOTGiJWHxLbEtKekEaM="
							}
							multi_step: {
								hash:       "QTN65244UG289SFS9VNNN332M7RG0QMNEG1AQIE1GCPT9EIAD3DG===="
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
