package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "uv0ve7n704KE9ybODyMZzdFsKFiRBGDulCjU1vZX090="
								"2": "keJpdTUPqaHriwrdXVHJZjSXWboWDSTaa5/+hBSTjHQ="
								"3": "JuX0AVVRwNpvhC4Bwv/scUxzEtEHZBCmS4an6P1Yik0="
								"4": "361OqtuQge9n7Cz4vheKGWGGBp1YABbejl1eaky3pYA="
								"5": "KPWr0YDUno2Gvye0OmLHBy7uA6BIPDZnK+QCwz/RdLQ="
								"6": "TzGR0AZ1Pz4RKI9/CjyQYFZzOzCG98PP7uqu66oGsY4="
							}
							multi_step: {
								hash:       "DTUQAU9GFDH6M57POSR8N478147TLA8SIQ507KQR7SCRNQVSJ8VG===="
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
