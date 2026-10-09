package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "I5Gb9onAa9egkxnBCq0GB3OnfJZLTB1bqOPixaoI2Ug="
								"2": "6uK/MyCBJfbN8Wgs+pHkAOUGuModiTEHjACh26nYxbM="
								"3": "KvI85yYznPuGHv7OBIA32uMdUXuS0mBMpmZUYmw+h8Y="
								"4": "tAIWKODXW0q/nAkdv2LbSEzXXYqCTzHo8eM06PUJiXc="
								"5": "oHcYlvBNUe8eWbWM1Bj/uL6ebPD4miG1EkBKvKAICI4="
								"6": "L/unpR1djHHpR6nZe7LY7f1IpYbav31LqUULgs4KTIw="
							}
							multi_step: {
								hash:       "SNINK5T2NTBDF2KQGVIMFMJ7GMR8GJ16K3Q34RH6EOER0GB9DO30===="
								scriptHash: "FSA0I8OK9NEDVD22VOU707U926VUFSSTASVP4GE4BF61L38H8B40===="
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
