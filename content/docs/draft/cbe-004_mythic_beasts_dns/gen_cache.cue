package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "4aChQvwCwRjGfnZWZx3qlYko47VN0nq3VRjk6X+pA+4="
								"2": "xulCk/ckRf5xx0HnPSrys+sgCzoh9ardidwSZPIugkQ="
								"3": "qHMdHJhKjd+PkWl7Pi6oF+Q2JuOOUGDqu8mi/dRqJwU="
								"4": "W+St6G1NKM58luP++jmVmd1fflDCb/Cfl9NzOQwEKTg="
								"5": "3P4MHHc0bl6p6D3PURC0sAFqGyctxn76tMTCPZvPg9E="
								"6": "LLwXKLoMIy8zGFBhvkcwaT7PzWVNtJ5v2tMHnLe7e/w="
							}
							multi_step: {
								hash:       "EU9H614F464DMA0820CSRD3BICJ60JN8IMOLKH1ISMFP4S0213HG===="
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
