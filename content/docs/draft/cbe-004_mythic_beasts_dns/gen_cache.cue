package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "euf5YkTgEDdaA7jhtMgcsVI7MV31quvb8guBtDBXznY="
								"2": "/todl7ECuNsmw/gGq5x+uy5d/KOdQ+nSn9dibLV+vFc="
								"3": "jOslk+ET5tmsA8T7Dx5Cm62FKcbiy89caUv/u9JWNmI="
								"4": "n2HQ1uA6KNOwl9X/WWRGWKjFnSS3HThKKHQnhjWi/jg="
								"5": "VE18fXaqxdKiv5z2r5Ifvz96Nf6kYpzT4wqNQA6skw4="
								"6": "REM5H5fm2d0gaxd4wW0Z1aSmpPPCLw6XhHuVCd0R9Rk="
							}
							multi_step: {
								hash:       "HG0GFHRKUFCLQMU15L9N94N76CT3VTEKGT84BA3H08G7MF42EDH0===="
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
