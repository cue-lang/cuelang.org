package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "7l8Q6slp73lB/GYqbtpwE84ZoDuV9CyDNuUdu6MvAGs="
								"2": "b5IF/av+aXpqqLukp3WJhJ2kvfaGYmIhVrKHCboYrLo="
								"3": "ToOHgod19+NPXlmpNUGTwYK2A3ZvlCSLdha4HI9ASL8="
								"4": "8wgBe2faYiPBgFKMJG9JVefMpO+ZdVT3XmAbaDZTTto="
								"5": "nWZGkO1+6lEMKLqVI/Kxad+lPXlseOhJVQJlEItV0WE="
								"6": "vISiSbyTz1w8wMobdTu2f0f8iXlrfg/c5JGv5X2SCbM="
							}
							multi_step: {
								hash:       "SJHFME0K7DPS4EPPE3EJ3VDBJ6IAMF3E30UEJ8O9EF8PF9B9FS70===="
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
