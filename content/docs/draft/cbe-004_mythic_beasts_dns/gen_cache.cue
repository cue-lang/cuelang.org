package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "UaevBQUJhI+V1SEsOv8kmlomjieZn3mljGWwv1VtlRI="
								"2": "wjV9pmAS7H24tEEY1lvEjroXC+99U6bH+6rGt9iQh/c="
								"3": "RjGFld3cc2e6306ZCEzczH6OtCI5eYlKx0N1gsLweuY="
								"4": "XYsiLrWFSSEzWbR8vqAf5P/l/zXnKhO+TPRJVS+UM4Q="
								"5": "F8IV65qb20layhdtbgH6OQUeCH7GYStdBoEGYTvjc0Y="
								"6": "lUhwoUDb4WiL3JqhLQKViRo55coKOu2BjMzPCfKj1vE="
							}
							multi_step: {
								hash:       "C385KG5IQR5ND68MTM3CVRJ34AFHR6HJCC6EELKT1G45PMTQTNG0===="
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
