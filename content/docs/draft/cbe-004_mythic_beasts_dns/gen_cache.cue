package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Jo41PakXwiXNIqO0VmzEJPBTfQ/Ph+o5y1wlPV99p9s="
								"2": "sIN/E7g6s03laN1ykIMZRmsbU8MWhtD8XYJinfXCE7M="
								"3": "dmIsLxMNMUmQ7tWYN4V/+GU0eXhGeVJ7QWfFwDpr36E="
								"4": "0QSLeFnorekolY+pHIucm+PSjbc8d1zENhC3+XhdizY="
								"5": "yk2+2VLGNkzBWuYyV+uLvkIOoaZxeWDcAz+CrPeuAVU="
								"6": "h3MphMND0rcb75/LOR5+xfstizmJnWky59gUrv2UEGU="
							}
							multi_step: {
								hash:       "I1TF5AJLB7OQ2S5A994QS23IGN5JCMR8IPNBBMKQSBIJ5808GVJ0===="
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
