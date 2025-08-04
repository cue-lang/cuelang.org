package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "tQiv0KlYD9htdZoIs71KkjBQIZ0IVpbgN37oT6zqoW0="
								"2": "jmGaYxBy2VHFe4FElMXXOWAqykAKWu4hx3iP/qbfvh8="
								"3": "BweU+EcwfwrYjvkWR71mBUzOYCkvCmw2OLjdVBey350="
								"4": "wcwfsnyoCiTchA7nCIBDneXUM/WGMwnwFhav+aiyAt8="
								"5": "dXU3wx/1i8vPCmN7fQbxC/6zGYVdIi1Un+HaQG/KNSA="
								"6": "awQDkQY7JxLapbhLidzTSkrE0Ji6aw/n+7jrY7U74IQ="
							}
							multi_step: {
								hash:       "4J95ONGMFR5QVTF4IABV067VARS15ABNS41ED563KD8FSP95P70G===="
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
