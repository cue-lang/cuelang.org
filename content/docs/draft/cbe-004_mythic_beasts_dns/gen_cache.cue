package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "tPr4NN2AiCI+LAmv8Zff8UuGqqNtvbnRM7wlNHibBbQ="
								"2": "1F5I53fwLIO0tQvTbhRD1dqcy1FfbEHvF1MEDtcy8qA="
								"3": "3ee0AwvC9S59wty2jliiLVw7xB+Sx0ZalfJq6I+EZXI="
								"4": "70gcEgBHF3LLqxmAWz6rxz/YFAtNssJxReabI6/fzAQ="
								"5": "bj3RPWnl6OyhD0aO1BDbXKIioWDnpE0sTYvCPxmF2Bg="
								"6": "6tQ6HkTmckLgRZYgspNTn5qcpbo0R5R9btkeRiRFipQ="
							}
							multi_step: {
								hash:       "36EIS9I4FKLFI4NQPI5F8F5N94M4N89G9JKEHPPRSEH0HN3KJI6G===="
								scriptHash: "TBSD7E08FTER7Q7L3RJVPMEI6TPH95PCHEEJ47GV2E8D69I7L7DG===="
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
