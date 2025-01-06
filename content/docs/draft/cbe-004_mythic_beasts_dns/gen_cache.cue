package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "dfIuVRfKZoVpcGQdssuzFvm/ECjGgOzCbbtHwEl3cA8="
								"2": "MglN0dxR9e18c83VhwRZqpW6vXcmFsbf1zRlFLEcHFg="
								"3": "tRygLSfP8w+DaZH6+DEDbwGnxVjMLInFuqzElrHrR84="
								"4": "9/UPYIl9njz1c1kw7Zymsk6cDqz3GsQ9h9xCtAHOZ7w="
								"5": "3By8/Ax84TyjV48J+40nGOy1jXRCPs9adfuqGOQv8pI="
								"6": "TOXrdPNPv2gKpYUvKzfVXFxufsYWR+26Z5oWlSjfOC4="
							}
							multi_step: {
								hash:       "0QHK8M1NR6IKK6D5L8F11LBAK28FJR5BLK1JJ9M1IT24R6HQ4GTG===="
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
