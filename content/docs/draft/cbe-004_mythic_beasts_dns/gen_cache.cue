package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "FWoD6ymvLhA0h5SpqZuV5eqcVHuWhBeiOiNxK7jzva4="
								"2": "aVLvaVwkJD/6Ftl1Urk1UlP31cIMnvpTSqEAaXSUAoA="
								"3": "1LdOLWlTk2cDPF0ehoqZz+tJaJ+FUrELvqD2HufNNng="
								"4": "03SMbUAoMv/IH2NmSqswT1alIaZqRkZQJ0zug8zujfQ="
								"5": "RQTjdym4lMh5YrkRm74M1a8mQbumxpA4qoKtiSxhZd8="
								"6": "xvBG7rfODRXpXLG+h3UYM6oGD0Z0QBfwtWGynjPOKbw="
							}
							multi_step: {
								hash:       "OFV2LGR0QJTPC8LT8GP5GPHQ02BT855JAM33BUFO1Q5UUUDQU24G===="
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
