package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "fRuQnat/kfKiWlZALAuScKx8bEyobZswtFMrTTV5/go="
								"2": "OrpTgKxIKfNhUMbhXJc809w04Y3pdNnCy+zK0pnT6BM="
								"3": "+XdR5qb75VWUOBkHfqeSaJbgEtC/0nGkprg08SJpFww="
								"4": "UyD0FQEDq4HAno9kddJLRNykcyaR4bnhIMUZOoTQkXc="
								"5": "4B1BewrKVhUkB/piY3laCwkYeAbrOYNb6Hi/h+rTFSQ="
								"6": "BzweASB9TS4uRUOCXhr9BUd729Mo4DJv/OhdHdT63W8="
							}
							multi_step: {
								hash:       "LE6P1CHBNSQOL05F843FEKG0OGK49O1OSJ5CMJGVAOVG4LRBCU70===="
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
