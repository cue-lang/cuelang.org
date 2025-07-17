package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "rvQWXW+qsjQFebo/F0wGLJUTUpeqLabH0YD12wVIlE8="
								"2": "tbpvfrh+44iF0HJSngmtAwV2otWynW9Wo+DZzVBiJd0="
								"3": "GeaZKZB0iz/qZr8BcWqIWNuSU3XGu9YlTV1VwHehcVs="
								"4": "ha7Xq1/GKoJGn7jx2Gn/tx53moaUbacEh+RVmJFaScc="
								"5": "DstbwhgfqH0GLvVXQPSQ3+KrD34JhcyNVGvOWy4KeJ0="
								"6": "RFr5epW1EGY+bE7mKewImZkSFVsngGU37RfHMsVY5FE="
							}
							multi_step: {
								hash:       "BCBE0I85UH444198M6KJFFNLDUONJBKFU45HP68C5P3OEI31J7VG===="
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
