package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "J5hUYvq46QcXE2yZLVGxs7XQKqBv+6zGXXcJgQpCosw="
								"2": "JGflsE8VgpOKHdBHgPkvLi5C6gbtoH1FTTPSgqPuD88="
								"3": "/lsk8A5FwMy8qCUucsGN8rdTlVJuA2UCHiSy4h1+Wlc="
								"4": "+HY6IxQY7+JRpRpBcazxbVjQQ7l2XjMNYigR4y4TTO0="
								"5": "262VTfITiime/liuDpLnNmkqCJE1wigKmjPEyrmIrzs="
								"6": "BmN73VHKxWDk8UZL/HoCaj/S146GUSwAq20HJOur5jc="
							}
							multi_step: {
								hash:       "R78P20ADDSKL7F79IB3E3U93CSN9F3IG8BHU30KMMVMMDVNC0T60===="
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
