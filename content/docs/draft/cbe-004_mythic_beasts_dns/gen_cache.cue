package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "jm713LGSJ6hDffB7zh0DyZpychOqc9WYHOx6L5oDBGU="
								"2": "3N6fmgjZ07Jnks1rbzJ/byLFX/DQIKyd7uQvzrHAr2I="
								"3": "QDK9PkUhTB/u+uu1qGAMtUJlnOcbf7x7JpqUtJQf904="
								"4": "bf5U2SkyLV+k+8uofdZdhLtH+R1guwLQnLu5v3NGu/U="
								"5": "8huov5BdB3tuxYI+RQwfFf2qogrirdojdlExaDCYhbM="
								"6": "5n0PdR0NjTUBjjax7WR9MnfyCSoWKV+VzXRX788hOjc="
							}
							multi_step: {
								hash:       "5EPTQPUJG5V6SO7RAKVSGU98BN507PF8GIOHM54HFQL2A49CQ9GG===="
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
