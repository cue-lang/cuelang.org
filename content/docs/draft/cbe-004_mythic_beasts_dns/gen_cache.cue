package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "glC5DIUVJBUInZ/KbJLulQv5Mtj8cE/uIiXn0VICPAc="
								"2": "dO+THGoNYaM7Xyx16hxeDrRqzaBWzIsLzUxLnh4vlIE="
								"3": "7WhjZSpkbYWg4uliya8PyReYcBc5oGJdJrJBpTpjW7k="
								"4": "3wKC3WxN9y4tP7E3ibGtuzja/4MVBCmQnyFrt689VGo="
								"5": "0U2F4C5wKAsl2OxUkqTD8iz/0df7eesKx56Q/GVhrVY="
								"6": "oC2sHvGyZsWeXaT3VJLJ/BTCc3LdRuUJXV7PEThqmdU="
							}
							multi_step: {
								hash:       "GPT7ES5OQJTD3E5I7RL12IOLHPND4SBVJOBJUC3CRJK9HLV29LEG===="
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
