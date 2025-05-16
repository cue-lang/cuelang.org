package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "sEI7AG2fw7VKiUDS/1thpZDHX6bUwnfDkw4FsM9A9Y0="
								"2": "E5XwWh7KQgD5K7tyktI+jgbpbrrZaeOPkYU7jr+97p4="
								"3": "CENmyXUgQNXK1UbOc0cH+NO52untuMR50dx6WZQ9GRQ="
								"4": "IgMd60KiAdPHMau3rq+azyvZbMXha+999G6Z9I1uCPs="
								"5": "00umOoNEYBswxY5APTEzRcezaAOX/Vuj8exIXtdKfVA="
								"6": "pBAuFgZgJWjTyFfGvUNwXTiQYYrVHyZptcQ62ZaZi9c="
							}
							multi_step: {
								hash:       "QO0IFAUURLL9TV04CK9DO7HA36NR70H5LANGQ18C0G65MUORCDP0===="
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
