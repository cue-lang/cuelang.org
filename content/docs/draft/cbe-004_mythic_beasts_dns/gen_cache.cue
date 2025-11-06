package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "zTtxKEB6cTf+3Wl1EZmCGmQoHM14EVtFQ3UcsI6pR9Y="
								"2": "OxjAtOpnQ0lJxr7++MNlk3jfX3kqMat9eHBzDFOS0yM="
								"3": "Se+bU77UjoYfQV4b/ckGZyKYjhi+OJVar7kDLdEiIGg="
								"4": "aSdcSn1P6zsN9SyfcIkS/VmvFAajF8EiOpICkJURq7I="
								"5": "loONTN+OllzBNO8jXcACYnS2g/poMY32dihDi0YpZ+0="
								"6": "4Nb2dVHM1DKOZkeHOktNhGkpvu5Xw7elFX+E+GTDLFg="
							}
							multi_step: {
								hash:       "D9MPPQDAOO2DAKM1C7G6DOTPS1RV2THG4T5USI734V4C9DTV8120===="
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
