package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "piAKkVOVtusFRNZTcGiePX4xJMAGrkKra2oZzc+L2x0="
								"2": "YlpsZagiztYYTO5K8eVaKiVXJtfeTXaS0HuNwLBusFg="
								"3": "WM8Mdb+JZK17W2FFspT2wFCzSrqhXSlry2yA4jtlWiU="
								"4": "jcp2PiAJr6u7OLGqtu/+pRqY6bCHcA81l7VKVdnLmvM="
								"5": "3ktyp6AmHufKxf9bQbdM7DrV+F46kHljQfl2Bk6mOfA="
								"6": "4+y4g5kqJmkso1UsxpsK8n0gkJ41zhsb6UeQbLMFlec="
							}
							multi_step: {
								hash:       "9DBRGVJUBQ8B32HRJIV35J8I7PLGCQCGPKLTA67EOSCLLGUNOQGG===="
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
