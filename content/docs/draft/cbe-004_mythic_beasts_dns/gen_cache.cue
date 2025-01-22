package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "B83bm4XTQqk+J+pEReJ3SBd+pJrTuoFWCzLoxSenM70="
								"2": "Ax5p3qkVGWvVO+J7h/+jWLyO/yRvcUPNkC4mZPh0iwE="
								"3": "bgJtalFP2Y0slxPgTO2LiBxGnoR1Rhta9gVw2wHU25c="
								"4": "8Peb//snsNcNBtixqMUr9RA2cwjY7JfZ3/o36qFz7jE="
								"5": "ea4vHWv7vEmfq9kMOr32U2CuNCkK8Umakt/7FnhaSTM="
								"6": "9cKTh3O1LZbGHZ1NsIhcKyzDHO9lQ/cThvC8uMtAYyg="
							}
							multi_step: {
								hash:       "LEEUJDAIQO4486UJDC49H3IFE65I4T96H6T4TV1BLEJOS1UM62AG===="
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
