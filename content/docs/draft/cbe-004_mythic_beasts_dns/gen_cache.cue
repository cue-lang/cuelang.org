package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "2EDneqUP8YWZfdQWb21n/yYwCtJXkPL5lF2z407RgAw="
								"2": "evsCk6C7QGbWPRyNqAmfMtTLqZeqV6u6qHe25pMJ7HA="
								"3": "fhsW7MzodTq/C3KZ7XEaK6duz3fcyQEQzs42hmhqq9g="
								"4": "b6xp6jKmhf6f2eb4qo66tyfrz5u0yb/+gnsux+JI7ls="
								"5": "MWn4/7GO4qgYUlgeM1JgzKHdt2voheDhV7XAY/Qvd1M="
								"6": "6ZT8AN3OEFK83JQlqTvMK+F36COuxqIwpwMb+cgMXxc="
							}
							multi_step: {
								hash:       "5AVK3FS0CE3FUVJIKKFI37V1MK94GO9PL2AB0S46JKA83VU8QFSG===="
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
