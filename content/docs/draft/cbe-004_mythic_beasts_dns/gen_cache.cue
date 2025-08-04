package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "qdHJWzmRgPajGFdJJ64ohczLcVwmQaBhS4OUhJ3cSQ0="
								"2": "YAIlAChvWHVCwVz2uIEhM2eYHy0BCYl9LiMh0+eyObs="
								"3": "Dcdcg3oYx6c1skgdp0IaXGOHJbIQrCRaOpRHZqkNxgA="
								"4": "Ee8vyHeh8tyRV3zDU+zq5RWs4MkMNQNEG3baSzao03A="
								"5": "kdUicH5kYlgJBR4SAqooiPxKEVgSuDwJ5BJigo3Dfu4="
								"6": "DKWu/8+q8I86e0tbq8idv4N8u2TUq89ZLegI5Nlrcig="
							}
							multi_step: {
								hash:       "3RC4843QCDL0QQT0QG9B76Q7ITO2LNSAPVC1V2QFF8UFUJDPUGV0===="
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
