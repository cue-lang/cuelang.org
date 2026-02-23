package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "43KAMMbSMUxeIseglga7BHqLVDDP/2e6hh/4Ck2L0M0="
								"2": "9yPPoBFdJq5ckxqTKk6VH3w9koCf32qPVfJgtcu+5Hg="
								"3": "7D4bsPw2uMLDRmvwfcQGk69/BgHR9i6Vz7tIs2YygFI="
								"4": "Xwj80rhejV/R8UzoGwFIc/xpz1QPX7rKzvnK6b3ydmA="
								"5": "oEmvdYwIo/RqRZQ3yECQd7hYZYNE+GIuGAm/pXvO0sQ="
								"6": "PIfbCsejta0qTOLHech1v1SzDL1P+RjNjKaEo9wsiEA="
							}
							multi_step: {
								hash:       "ODSKVF2E1FPIBL8114HOPEL30811TOGT3I1G5H7AOMG3RGQDKNRG===="
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
