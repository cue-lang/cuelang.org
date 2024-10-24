package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "c5n/dsbXqykbmtS6BqaxhkYLduSTaX6QT8VPG49yOgo="
								"2": "Vkb2CFSYzdR5rdwravsiImV2LiE9DrtmDJAwlzQr5cI="
								"3": "bDhw16Kr1bfgL8/5cAS778/nUp7PtOi1ISlj8gGdw+4="
								"4": "WLo6KaDTaG8XdRkcnN5G9srsfKDy24tdfZe8UHeaFo4="
								"5": "WMuVA2JtVpBCOjoILsx6SrkxE1V8aqHS2Es6N5d4vpQ="
								"6": "pQDFZi2FZTcpwESM2u5qmBnZCqBjqd071jwdhO/RDeU="
							}
							multi_step: {
								hash:       "DN3NEN8H9M74I1N89RCIGOSQ1F9LKN49ANRJ6BPRJSBT444DK9S0===="
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
