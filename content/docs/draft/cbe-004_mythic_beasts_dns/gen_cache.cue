package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "BckN7/IOza0dxe6QiHtgRqONx6NCUjwhgPkZ8JdRyhM="
								"2": "ycXQGlrfsBJNt0AawGV91Zt0U9NIZxHmdlMlcmd10jk="
								"3": "mgazZ2zkoNvoKo4EdklF8afkEsG0x9LorLQokM2wVkg="
								"4": "P8gvf/Ojiy/UHx6JqDSitprmpaNpCCpJbVWG7/b5C9A="
								"5": "Rx4IxHEE3ua+lXuSUynxz1vkGa6fUp4Y0/n/A4+HZgM="
								"6": "ZvJHMjyDbPnduUlDVt6EV4KQvogusnx9u/yaB/clKOI="
							}
							multi_step: {
								hash:       "2N7G8KQPU59FE7ELF6T5LFCS039I7QERGMF8CBNLPTASI92SPQQ0===="
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
