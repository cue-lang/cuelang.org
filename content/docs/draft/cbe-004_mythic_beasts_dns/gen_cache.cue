package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "1NKMzyXhE0eGRDHWgTL4Ao+pLyqX8FcU6gUov7RAhnU="
								"2": "Jtrm38lJzYTqMkMuDnA4KN5yacyTv2Nwpna38M7RxaA="
								"3": "ZKVS5KH2JN38OBc+w6bMkkq3YTPNfibSEZ7JeB4cppA="
								"4": "lOOBGuDilDWlue0OKULXepRHYpl8fdn2rFdtN1zQi10="
								"5": "pale16GrcSUPbySQ+f50JTDVMAMl+hAx1zVjf72C16M="
								"6": "yjGMKOhV6SEAJAgiN3xaH+/iDmp8FhM6dOiGXorFl2w="
							}
							multi_step: {
								hash:       "HVIC6AU9JVU46CFJHGE8G6AFHOMT77E8SCQGE3CIK99LS1QSGOPG===="
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
