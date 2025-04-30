package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "2jIpiM3riiao45Dd5hjIgUQyQLceFtkYvj0E7rK4qCk="
								"2": "vC0XPduDH72195Bcupca6JCzSczO1zXy0q7ud+OBLkU="
								"3": "x9ie1hFzcW57bSBiWRplmTjiOUNRJ5oidusv+gW/zG8="
								"4": "9aQBStWt+XfNTVHiupCzqmmlACFUDcGfBnHhHdYV30k="
								"5": "8ivKxPHDVi+6SPVxk1dNUOduGhAw5ZnFKFy67sodd18="
								"6": "x/iBdf/eg0Y54F3xiR3iDgbsYEQGPfRFwZf5U7M+f2Y="
							}
							multi_step: {
								hash:       "J3U9HPQ3QC9RGO5C43DTR5IALE6F5KEB18LOS411N8MBCHJ2AE0G===="
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
