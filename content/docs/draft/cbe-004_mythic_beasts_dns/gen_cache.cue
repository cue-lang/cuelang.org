package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "vrf8v8cfxD5IAJRDdhEIfNZHRAlK9/VDWXIPffLsGZE="
								"2": "AKCWQDFAlUCZrZOZj4JiKs24k4qmjHYdjwSkf8Rbb8M="
								"3": "hTXCb+g5dxrxapInE9i9MoX6+j+amzn0uBJxVCP59i8="
								"4": "JkEj1G7ycq8LHCDnUmfSbFRm8YZ6psl2LSpOv+cDYBo="
								"5": "z5LZLsA8bcGyPTwVCCJropuzwqhPYUi6gP0pyvA2dys="
								"6": "t38OiCWBwKiMQXFa+K5mZZtXQ3/QO1QafkQYF0VocqA="
							}
							multi_step: {
								hash:       "TPK670TVGU81Q0BM03BR0EPD2U57CBILQ22HGIGHHSN12GPAO1I0===="
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
