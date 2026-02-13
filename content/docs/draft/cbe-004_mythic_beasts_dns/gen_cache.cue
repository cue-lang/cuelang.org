package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "cn/A2TP16mGFXvqnaYQLsxOcQAdJynFhJn7DsdGOlrE="
								"2": "61LuyoFPRz0OvEW+hLSSh4htpJV/zOqJdnPdD5XdjFE="
								"3": "VoPP6VyU4tdRQD7Iwft4yaBjbMYPa4BvofDMjf8laFY="
								"4": "jMd4bX2iC09p/8/EU/AUcKacOonHLLxTp5CC/i+nZcE="
								"5": "vZ0ggjXhRJQw4u9BrBTXUWxKuam8CsGghl7gd44Je0o="
								"6": "MJJ8UsewwcbYbJGkM6nBO7j415wbBG4BwQEzbS61QPQ="
							}
							multi_step: {
								hash:       "E0LNH5F4ERD9KDMUKALULRS6E7HAO3B4FA6LH284QILV3I15G6KG===="
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
