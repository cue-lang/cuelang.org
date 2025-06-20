package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "0HoJhP8Enn1QCgfr3M+YplJL0cCCPqVO/csxjwVUylg="
								"2": "7o8b7bcTegLSjYaXb1KqbCUItYH42zv4RGw7JZT2HQ0="
								"3": "vmrYGTc/x6lSbkNwtTHhgMHPOsJL/duU/C5abvC47+k="
								"4": "mREtcK4eLdPfEsXgYSG5IS8T3NVAR4eJ8LV4b5SUNz8="
								"5": "XAXDvtDf0NhAl8Z2CxZ5rG4r9pTSg/M5azBHlCsaO9o="
								"6": "CFZl4uAoHWIZUhRdmUpzQtouVWZSqKCKfW7x2WcnYKg="
							}
							multi_step: {
								hash:       "0IR2FI0A92QDR052R7H44OCM8RT6G65PPV9IRHFL2VJJKJJI1J20===="
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
