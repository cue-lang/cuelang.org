package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "7w81+PjGk/+mFELgxF3x1ROzySHpFdMof51Vy3zLyBI="
								"2": "4yW6A9yk+OyVItCwVlYvKahfoebuWydzGJzV3TeLjqE="
								"3": "PyFClFRMT9V+s7BubcoCoyRrKhFHeB3VAsk6JvHJ6kY="
								"4": "fsOdWR5qv4Z813gLWPRKY9gWRpYFwRIFqV2xOj3eBEI="
								"5": "LQxcxdd0kH3icNFmRArS/FXNWLjuEzT/3bHNHsku+E8="
								"6": "QagkbYyO9V858gQwQ283DVAx8rrain6Oa4tv4Bf4slE="
							}
							multi_step: {
								hash:       "EDO0LSCB585H9REISB8R9IJPLCQR7N1OACPK5TTIHQ191UO2B9AG===="
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
