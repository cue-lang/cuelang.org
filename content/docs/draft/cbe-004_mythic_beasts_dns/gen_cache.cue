package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "hKapzdypd2GiTbOGlmgUmCrC0a3kEuJoPudKZeIzFXg="
								"2": "N0WbOGHVAmYPRWm0tDkz7aoeXOW8RZSqXD4/O85fNAU="
								"3": "59Fh/xJ1/x7X22FXrO2p4tBTFyoJ20iRE0aA9tFhcyI="
								"4": "c7MJiHRBr+ZjBtpwyV6MGPAof8jHVHM5SpJJJ5GeXq4="
								"5": "IG9GFrwqQ0PAr4Nki0kbO3ILCuRZae1dLMNDg+YjbCM="
								"6": "p9abqKPSam9dxlbNax0nTh1Z5cBpvUrmIMJmXif1Muk="
							}
							multi_step: {
								hash:       "S6UFTIT16DADMKEVM1R04CRTR7HS8T8STBH8HG1UIB787AB6RBL0===="
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
