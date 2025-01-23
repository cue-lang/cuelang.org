package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "8C30edXgvx1xZmMbZ5LsSrRIIV3cWwxi4z0AzbSYIe0="
								"2": "pf92YlX2hjkc6SL5MH7QmbwsqiFKVL7S4bZGpqlKpKE="
								"3": "KMygrX5zFKm63WMPd7K3byI3BSHNKIkQCR9h5Z/ro0I="
								"4": "eYp9Vw5sX256RELyHTyzSXeCE2mFcsTCMj6a9iIYloU="
								"5": "8U3Ovc7Qq8VxudLNQCUKEajcWzx4ta14Eg/q1uZV+2k="
								"6": "AAC5gkTnNPGkMtraELnz0MvsiiojBUUnobnN/UX4VMA="
							}
							multi_step: {
								hash:       "ER0S3UNJ34OI5KL5S356JK9117591DU8BQMN01BO93C0Q1D6R0G0===="
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
