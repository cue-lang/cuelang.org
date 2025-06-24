package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "WLqFWoyQSer5dooJyPVFUboQQKmpByeN1UNW5plI1kI="
									"stdout yaml":                "wdIPNsSCJ88zqA2ulMpkv0MsCz6OhjdnpWCgRDMsR58="
									"yaml:-":                     "MPmDQWzSixIpaNX+VzXo/GW1hux6aHQ2cBHDtBFOfzQ="
									"--out cue":                  "Z8lEeC1xPhz6rTcAS8uTQYPPuVUBi6jWqdtDxIBLs+E="
									"--out cue no hidden fields": "m4a2+6FRYrhI8GhTMM6TxJCE+Jnt0UBWaDXXIMXNMFc="
									"--out cue --package foo":    "slIS8a86qGhHC329w4hmAD67PVsiv1RlrlHWf0XhwoY="
									"--escape":                   "t4/d3GtEmfh9NQze2RIEEroVyjVtW4jAH7I4B8L2ajw="
								}
								upload: {
									"--outfile data.yml":            "m+D7FbzixCwaPpu8oka/IAwH332AUfH8jDsBsWgdkKc="
									"--outfile data.txt":            "vSKgSrcergOYV24jopYLylzT5LGyO72F94GZeYFk8C0="
									"--outfile datafile --out json": "I5/GL7aDeNbejMB0QN6+W+nZR/As1Iekbgc4naV/FWg="
									"--outfile json:datafile":       "pvoFL6//NbMmuuK+lLYSL1TSdn/xnAjo3+FpCoAPBIY="
								}
								multi_step: {
									hash:       "I2PVH9GS96KJRMEM3BGDHMPTA6A45S8HBUU64S0NQBNB8LS2GM60===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
