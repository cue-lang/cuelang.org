package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "+seFKYmMB1uJnnjorNeWwLFcxqF0esPi/4TUr2DxAzs="
								"2": "Fhq8gCaJ0KqzcVeSs7D8P8TgdYYZFJwW87/k4c3U9FQ="
								"3": "v0YZjATpcHarr1uPXV3TWk9RjDkmmHqeRtq6RopZu5Y="
								"4": "U6EmImQt5zYxblNyK0ZoHBBsv8xFYLgMPs8OZjBpv/8="
								"5": "KODUDe0wL/AirzubUeoElIaufTELuNOfqMk2Bz6Nyfw="
								"6": "TXkuxywu4AUxPNmhzBzrQc2TWNyvpcHVtfGTKfvR77c="
							}
							multi_step: {
								hash:       "OL1F4RIL14SK4AO5RRQCCTK0JB000SV5L4C5Q7QBQK6MD9KL9TUG===="
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
