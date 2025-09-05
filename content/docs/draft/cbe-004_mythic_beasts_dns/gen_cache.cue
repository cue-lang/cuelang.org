package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "NUefe3VFEYX4WuTmZJuxn03VYGKC7kVVtvo19glqh+I="
								"2": "/ZI2VNbyda6Aw1OxfBCwJCYPuXvbNxzbg+D1csYmvKY="
								"3": "VyneZd5gNja70shK/1aCPeGKOqM9CwU8BouS9uORifI="
								"4": "X/12Xh+4USY3BQVzCa/tSo8oV1hBDflYRZ4/6EftqRs="
								"5": "4weqC1GIxyYBBYgZ5zInFFTS7irq0jhJPkXnYHSwZ7U="
								"6": "9qbhuJIGnz6/863wk1IlqiQKfh43OdqVFcx+QJxmyds="
							}
							multi_step: {
								hash:       "GB17E2KB2P0JNF1U7NAHMK3RELEFB5H87E7JLPQ83TL10B1L9OE0===="
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
