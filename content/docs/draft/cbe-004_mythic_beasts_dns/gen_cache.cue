package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "5vP72otJE7ttQe0ko4VwgDCOTpZW0UfMP6c6nNKeolE="
								"2": "IyExh5KyoZwd144grXxBSWzjHRcAwT1DLeW8DopAMkE="
								"3": "d3FnUPHwKqO2Ss55ItT8djmCtbLPuE0f1PgmANcyPe4="
								"4": "L9TNSs69QJfs0vbYlmAvs6L7j38MCVrC2EoJOjyPp7s="
								"5": "hPiy4FZ86aE+ngGWJdcyj0MIqPsjbbdXz9qLGGkai/M="
								"6": "+Qz8BFK37KrTtzHJJnmcbYnhQkhARmE2bElBAhKEquI="
							}
							multi_step: {
								hash:       "LR7INEMQIAS4PJ2UCJ60IL71TNJ4EMG7NC78C1BHH57T03A2PCV0===="
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
