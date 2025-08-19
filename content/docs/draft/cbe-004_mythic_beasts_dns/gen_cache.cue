package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Z+aYLqRWHxaKwVt9+IUV8zT2jzJsNR1iRbw5eSvgOws="
								"2": "bw6Vqd1NjEO2dsy3WobBkdD1fZ3au1jV1/+j58Y95RI="
								"3": "efQ01zCXaQzzKMpkbf7I6vBr6JZj9RLkO2+sBjnl0Uc="
								"4": "ySm3ihL2ihFLh9To42cJD//Xd4EbUJDEPeBIe9TDOIM="
								"5": "IbWE7qbVulI61sFlrch5/LrWRnEcIfPcRS/7r99ngQs="
								"6": "hiIZp2zTowrg+9jsS/GJEVh4BCYcLq1x9nqgJMTz3+Y="
							}
							multi_step: {
								hash:       "F7486S03H4LQU79A6P3KQRNKLEV8E16LGICOSNULDH280DJTDPUG===="
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
