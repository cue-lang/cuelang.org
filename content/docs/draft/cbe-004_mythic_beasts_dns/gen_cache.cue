package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "KSykFt+rgvCh0zzlbibb9TZD13ZdOOVukyxbslIjExU="
								"2": "OI/KvWM1eqRmzj/3kXhOCYi8HxKE0D91ojx/OKpgJs8="
								"3": "CeJ68qI0AI5H2hFHT71BDfWH7LBXYoU8wjWZRSMy52M="
								"4": "OkvFObmxU0K+RPfLuKyF7tmn7qd6JIzKtsgn0EJjHcQ="
								"5": "pi24dIce6lKkSIJjBL1F41tdQ9liBYHbQfe5OsJi9mo="
								"6": "1h3Il+sZfmC8V2+sGshTfqUf7ZYhSN1eCo7CgXOJsPY="
							}
							multi_step: {
								hash:       "675UFBSAC08AAR0S63MPSST9CIC6EEA024588CNSCJ7UVHBECVRG===="
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
