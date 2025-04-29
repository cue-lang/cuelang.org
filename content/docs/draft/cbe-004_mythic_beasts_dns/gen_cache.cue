package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Ke/9Uye2Shu0hOBCL9/CNkgUbogD47hsxtv5dpFtf7s="
								"2": "I6x8nWb8ytZwV7fgmN2L2RWEctLzRh2IVJn5LlePnnI="
								"3": "qIKLMvPL8WQWfKJnaC5rPYZhFZPPM+3v5E6q/RulJ+c="
								"4": "XgVrVF1h+SMfOGNlUtzThCtrmDgfSVwc8EQ7yFpC/xQ="
								"5": "pGuUwf+7Bi+0i8LwzoM7uaRz5iSAo5Dh3YBse5tfPPQ="
								"6": "vjZuDcTLeNSib4z7p5UqLWbObD/YV4jyDbLNGCWjpDk="
							}
							multi_step: {
								hash:       "FK0QQJ8QO3M6MI9ESLL3FEU441CO6UOMCJD2KNPNJ624J067Q340===="
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
