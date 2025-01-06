package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "+3MUgUTHsa+fba3jU8NM7+0v4Miaa7kkePONAgvyC68="
								"2": "dqn2fNu2omk6gzQH+8LtShHKWBhrSenGdov+3w02/5s="
								"3": "nwYvZfxKj22ZJ1a00OJFcX0qh7skIFw2gYCg2YJoS9I="
								"4": "D2T2Brkbe82HGqSFXxSrNdWztCXCR+xCpqyGyavRDCY="
								"5": "weGezoQyuM0X/qZCkIcteEJtYlqCGNQO1tlnBxa4G0Q="
								"6": "2HvjzSltzTy0ITe9VtT2UbDCWXUbzgGdowU6KKj37aA="
							}
							multi_step: {
								hash:       "QHBIJVJ35R21GPIAD19PCST0QLRUIP18C32M3G3I30NTO6DPM07G===="
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
