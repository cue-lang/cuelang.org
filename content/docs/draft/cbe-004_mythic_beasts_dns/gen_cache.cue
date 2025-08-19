package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "zi3GPy8iA1fFMZuThkALEaLzCU1YpMqrV9aOZMNzQEQ="
								"2": "tDDAgeAYkx8mLUoKXAqc9jkU0IwDwTCP00lR3klISW0="
								"3": "7nS9PLnVxG4U/5M6IvB0D7lGBxW88CB+3lSE6dLsSSk="
								"4": "aifESIUo/cVlsuApiiqvmL6tsxR5/DOb64j+0YLbwSo="
								"5": "k3fx8wrvDMB6zn42jrvp6qEeVfzwJttrYxgtb0ZwBBM="
								"6": "Ud8BOrrFhsgvJkRYLr2OuAc8Shfp9HMJY+U7fIdPmxw="
							}
							multi_step: {
								hash:       "AOTOT7NRR09JS0LCK6RIE5DIU7OIHCRAERPDAQ1R1OK7195EDMD0===="
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
