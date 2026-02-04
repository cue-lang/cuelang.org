package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "ZXKpn+C6gxoC+o7Lf8u6MbSt/rS7t9F/ipfwgMpxOyM="
								"2": "mnqXP9y6fuZlvBjRLJkfwupy/B5QGgcTGuhYkbQEomk="
								"3": "hBmPCotdDyBGVoV8MyD9vOzHUFvy9JgObl6ybrDqw1w="
								"4": "8PMntpXDJ3ZQReSa4ZHWDI61sMvQaGeZuf58DWggoPc="
								"5": "kDTr5YLUqwUkEzfoBeqpL+CpLsUQMmZXDs+UohRxWGE="
								"6": "DYqm6RpP/RgtOGbw8Jpgnrx5atosdqxFsJd/x43TI1c="
							}
							multi_step: {
								hash:       "6UUN2CHQE9IIR9BHFV7HLBMK025MRBTQEP5UMK6Q1NSB2B5O8F4G===="
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
