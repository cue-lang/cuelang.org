package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "pZdj/NzWapKoh9PQmqQZl7V99qQq0dqZDYS7stvyr4U="
								"2": "I3qbP82qcejvCpUD+nRN3QPsMpa2oPiXLQPvGJVc19U="
								"3": "5AuVvKnWpkWKGRpsaxyYwYuikNh/IBD7O0+jbyi793I="
								"4": "+FhFpSIR6sdZIgATDromocUiqKZjURPD9ZbNWM3XU/E="
								"5": "i2BUspyjfZMTdJVflSE42LaW8IMwIIZlagyHOffxXlA="
								"6": "IA+tTHJ4Ecjqs8I/mAgLsLusnnFvOXj/lZsFaDhQ2ks="
							}
							multi_step: {
								hash:       "FVSN58MO43B0842BCR9I28QGLKFDVD2KQQUPG9Q3HLCDEMDLMAIG===="
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
