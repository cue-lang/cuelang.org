package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "YMuhDl0JQlFP6/zJy+U2QLr88DDucBH+7MejyhrD/3w="
								"2": "To+T5qmliL5MjMrcNLBbVB+uuBwjJDJfLsMOot0QJfM="
								"3": "74tFuJPnHvJJdkmty1KAX23QT+Imxb8lJ5RjMOsYNo4="
								"4": "0fsbvUrDQCiCNgAHHy8Z5pP9451JPWs+VJY5XSjIJSg="
								"5": "QTXtuW+UAND2Sx//wLLwUrs/XQtjRHKjX7R22numCS0="
								"6": "ktQMIbu6YqJ2crR+MxjowkAgzn8xFTSx4JpO44BTr9E="
							}
							multi_step: {
								hash:       "GVR4F1PILQ9O6QMP8166147MA9K0P4GGA1K929KKCPJLFC7DLK5G===="
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
