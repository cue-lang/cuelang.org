package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "d+uhVEQwCV02Wp2aKIbNoPhSIA0kKaBrVh4gN6DiJpY="
								"2": "ZYjAIK9ju50hTv32JqjRH6szCW/LTKxdISxyJLSrk3s="
								"3": "tlhI8Sq3RVYLvKNpivkHNMv4+GjbSsUqWYNl5zwfYkA="
								"4": "Uof20gqjAVoVEyeTz6+0tT9PJRADlzZKb3xIwENbE04="
								"5": "qlkoFt+o8ZXviDCEh34lPLCo2PGOkRgh3vIkAkuJKBE="
								"6": "RnBx7zSR0wSKy1tIQz4teSGPMosdifgb3AgtPn5Hb6E="
							}
							multi_step: {
								hash:       "AS87QIRCCPHSV8UV5BHM8L8741R80P25EL07FSOCVG1Q2GIG1G0G===="
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
