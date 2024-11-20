package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "QJhWbGJHb4plstJfl28+0tuA5x6e+Qra+2BWciAneMM="
								"2": "TJAgsQs80hx6FNqUQk8f/zB4GisFXLN+c/83cFpdtZA="
								"3": "Ze9Jewsdpmz2YezdlzBbVegfT++Tmzsh0E3c5tgGdow="
								"4": "VauxaP5TfhppH3xxHI+8seLs0DwySzBHC+n4GuRBc9g="
								"5": "jGe8vPYZaa0GZ3tsw09OOF/rTBJHdWZlCRT/+onGRKY="
								"6": "biD6r1lN64rnZ6GYFr1B4aOntwErWIb12EHjQDtklXE="
							}
							multi_step: {
								hash:       "SN5TRHLP7VSKDAHOCC644C7RONCN4D1TJ6BO8LFSDT4MTLA9GUE0===="
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
