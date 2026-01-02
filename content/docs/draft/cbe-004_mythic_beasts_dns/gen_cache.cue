package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "TiEM6m5/jhODbi1NXCBmF7cy0S77xxhPHXxUM4aV1LM="
								"2": "BR1H2nICuJ4ledFUfW2XYLmf4+SwyV419CkPemfzuY0="
								"3": "b5LMOFrSKxTVVnwXW6oT1uWuNH+CknvU3MYcg6Fn5M0="
								"4": "HhmPNgcvZlo9GY+PaLeIKeUEC2edCTvpZjqBSBYTiXk="
								"5": "5h4mCXSzS0Btg+Jwn0dWq40zHUVWr4GiXhS+q8y2D/g="
								"6": "EVL8TXuQaEkOGtMdagnG40N96wDZ0ELMPZ63nC1vei4="
							}
							multi_step: {
								hash:       "8H2JBETB99HCT9KKS8ONIPOHDVNAD1BE63QA64AI68CD07VETJB0===="
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
