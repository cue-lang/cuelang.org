package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "APMBKVNi6ae+GYHn5m+ycefCpMM0TE0yoyWM+anzNE0="
								"2": "cl8VkSLb2By/iN3O8cCAPcIAHmx+AyYYyYkWR/Kevdw="
								"3": "/09g1zkx916osZjBTNoZ5FDyTFNqoRCE4qC73hvPBXo="
								"4": "EAzied5IgN7ODhR3KLhiTCsMUxrgBCcQ8z5vUdIXGcY="
								"5": "TSyHv/I713Y03HCqJX6VZnA3yq63zN4GVggCGuGTrU0="
								"6": "kLX/9epjIMKcCT68Vn9NNJAlKdj+oECDnWGBtIQYWyQ="
							}
							multi_step: {
								hash:       "INVJ214A0JOME4VM3S7F1O2VJ5DR4V71EFB5CKI02AT66E038LGG===="
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
