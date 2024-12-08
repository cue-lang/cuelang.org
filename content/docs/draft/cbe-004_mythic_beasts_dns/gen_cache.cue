package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "tmRQT7QQAFzcl/MLpATTSqlHZURQgJY0c6Ooy90ItOE="
								"2": "XMRAsmw/BMbKATTKXKxzc70iazgIZCWoxDxbncqXG+0="
								"3": "jeIPrRgxWJuezgCqrnGm6yAlRkt6s4OTlg8dO4jYUs8="
								"4": "CNvX4ruu6mtv+sYug+uISg2ebj3oEvJLCbTXvfUgYgc="
								"5": "4IHT6C+FUDJ/V2ObTwvLRFx+CMeJSKwfVOldrEiZpBY="
								"6": "yNK1fbK4ALBOOCh4k0GlW7+L6HeMn1C/YQNW5egP8dk="
							}
							multi_step: {
								hash:       "9U0L0CESO07J6F1PBEGIHG46PVVNM0QCMTO3OBU7KFVMQMP3LTB0===="
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
