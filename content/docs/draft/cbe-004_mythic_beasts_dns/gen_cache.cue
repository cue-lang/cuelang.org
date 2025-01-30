package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "cU9rRHtuBrApFN6/Q/T54RyjlbAsC14ooY4bdvReVUc="
								"2": "fckew/Hp/xrA7U+pIrMbDBlBqUF6bjr3aP9vI6njQVs="
								"3": "XatS6HhIQohSDpm8ysku0TcG95jGZpq2w4mUlJEJixU="
								"4": "SBWjexorx51rk1Zxqt1wxg3cVZufF8mQ9bEhmd0A6xE="
								"5": "fRbmr0HRtxyNWHCULDAzilLYuL6TbGYU3XMJBqwpa7E="
								"6": "zYRUdRbVyOV3j6YDUcZDwKH+EmgTeG48oTtb353nKLQ="
							}
							multi_step: {
								hash:       "SDB34P9T617DR3U4DJ6IINBBP65EN0FHI07GMEGHT55UMU87E7QG===="
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
