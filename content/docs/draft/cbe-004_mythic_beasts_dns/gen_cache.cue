package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "oeMH1tr4J/BwYrw7RxEwasjxObz9u8rDOi7McNtqaYY="
								"2": "huJChZHo/Y48oCQzK8iwhEWbo3OiMfLM2G+jCgoKce0="
								"3": "VYWUARl/cTfHMG5p+gpkxnnVxIXJU2R2pJnf5wvORCE="
								"4": "/GWDNRQIeXsCD5Bcf44bJc4X9BYrw2SLeoqdi1SR/Iw="
								"5": "wVzkBRCHioYiKzSJMrRUjLUzaN301x9zkL6YNHsr1rU="
								"6": "GN1FI/b3hWgoF8BwToTAnyjAyGyJcUhD1p/LgmPRTd4="
							}
							multi_step: {
								hash:       "OO1U6FNCFCV4UEC1BKEVL1ATLMDILJGLK5446B26C6C0RLB3SCQG===="
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
