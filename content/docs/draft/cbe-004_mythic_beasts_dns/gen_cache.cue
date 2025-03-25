package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "j7sQqRMOCz5B3HNBIfEOJkOaGW8yg6x33egIqoJ28Fw="
								"2": "k64urE4hrEqPIbhZiQivEBbKnzD4nwFlJX4wI6HkzvI="
								"3": "GyWkFjAku+BaI5AfTjGbNsgMt6LbZ0mWiW6apRE7Gmo="
								"4": "3o+dkbD9GoyPRlq4pvnTHHANGITvwb9R5DPuPZLqH/8="
								"5": "JPa9zICb0HbIxuk9n/PnkVT8NwhzZPD8K4EXAew/0tk="
								"6": "EBf7w0LV6mgXplr33cUMx3TRWJPsRzrEf78ONI9srk0="
							}
							multi_step: {
								hash:       "AQNPFKP1KHDFRA8VVD19359QBFBK3NE5AQSBT89RI67E9NVOP93G===="
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
