package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "zll1oRVgDmKCtqPBw7v2hyafGRMKrzZZ+ddKiMy77+k="
								"2": "flgq5YTPNfs9wVrpoT7Qb3v3KnWTd3vEn1I315ASoNA="
								"3": "cVbvEBxuRhuMkIguNsFACrV/PQWMuLfzt+EuxxUkx6s="
								"4": "/jHfw7PLHMB87PK+cMWDEszhkZrZl4PFwD6Ge8FHb58="
								"5": "udmpdKBzAZCs3Y81NeQck1+eMyE/EvPuzFqgfAJZ/xM="
								"6": "h1uwuj2Y50pmkSOF1ajeinZykToB5s3PaUX9mogdp7Y="
							}
							multi_step: {
								hash:       "JKDMC1OOCTQM8JHMH8E9D1K48PK7ESDP72SSEUOFCDPCMK3NU76G===="
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
