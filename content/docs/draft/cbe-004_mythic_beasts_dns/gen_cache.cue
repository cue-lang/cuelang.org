package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "X+qu66UrHx3jfSnUZQ9vZMqhGVr21Pvm4kw+taCLZKw="
								"2": "MuEFeqGrvTLtHek3KYJ8WFPOL8XsfxXit6Kf4pPYoCU="
								"3": "asBHQmT64ZHgVMBNcg5hZg4G7nff3gZbJoOJa133Uas="
								"4": "p2vkFNXTjD9/nlN8DGJvl4zr7j6vJU/hzmBSuBBhTkU="
								"5": "7EGz7bFNzh+UldQzHIYb12QCYIx+laEw2n/8Z9peSY4="
								"6": "thSO7Tkz7gCoy5UM5s7oLM8pogv7S6VjDMN3UbfF+Ig="
							}
							multi_step: {
								hash:       "3G59VJGQU72VDCVBMONEQV9B49GDVI9LBJ2C7A45H1R7T1G2MEUG===="
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
