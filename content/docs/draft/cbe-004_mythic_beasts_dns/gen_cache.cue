package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "5utelwkEPm3eKMj+y/Ac7ff9helCVW2drgThlvSc3Y0="
								"2": "ddxivnU0uomyWu/7xobxqHQQxd6UKijFwg/p+sk98Kg="
								"3": "oYj/4bA7Jsy5UGHNRDNZcrFb6kkRGRioMml9Rl5jwrE="
								"4": "Z2J2kOTiVVi75iUfl93cQS3npTd7XTeZLzvkrs9MG40="
								"5": "OHTIvtJ0ma7rvo+x27Tl7ztmHZ1Np4/PxJXqQ/XePxU="
								"6": "p8Nhzqy5O41ZZBV9RxTjaw3bSc6AmOqPaOTUds85FEk="
							}
							multi_step: {
								hash:       "5ESVKGM7J569J8JGG6A7DM9F9PV86G6TBR4D0UL3ATU7IK33PKQG===="
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
