package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "YKvK7jDaxdjYLBEVX0VmNdedkH/3QRe+vIeJzZkO6Rg="
								"2": "vay2FsFDUaBq7ETuaFHYvM8hJGWIXv27AtOdpcxiYq0="
								"3": "vLf5KzvOk3FrM3VoF5zBxfsElRgEI66stOmT3b4GzsE="
								"4": "VEFtVmmIZeou+xUW0/oC1cl3WKvQZ6aHHKiMW5qzxrA="
								"5": "3Aphcz0wjZOlBrDImJng3xQf215w/yONO5BHwjQx35M="
								"6": "B9tVwu6KchWr/l/tGtjRJCYLULR6IyKt0+72iy657KU="
							}
							multi_step: {
								hash:       "P7BJHH8K72FUD5C34UKPE87UUH8UVOKT4D19A04UNKTSSG76704G===="
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
