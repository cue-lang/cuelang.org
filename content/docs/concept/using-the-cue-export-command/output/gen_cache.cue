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
									"default output":             "zNkR6+IsnLjEipXLsDjyhY7mRyW8sHGxXpz1M2+6UGk="
									"stdout yaml":                "OONopaKoJVsisyyYtqtM6kwkfiqau+cMsE/rCW+YEQU="
									"yaml:-":                     "J865Xcj8U0o2EL3VE8x6eHqbAhfQR/3U3yIvOGbr2Rk="
									"--out cue":                  "JTfOHQdPNBUHLoWHMtZPnbwkjwrszTM+aP6CZhGoLCU="
									"--out cue no hidden fields": "wJFxjXqV7bhoYRnWrORtduNRbs5VTFjEju3KOMB4TtQ="
									"--out cue --package foo":    "OZKQNi4FU1ll5qfSID3oAGfYF4wWvXhOo5/kHEsksVg="
									"--escape":                   "9O5b62kcKGE0HZxJbStccPJJUtm9sMHrhsoDnXRmS0M="
								}
								upload: {
									"--outfile data.yml":            "M7dX3zYrjf+H8bnr2d6l7T8fDQoF3/iEnxSeOlj5lZ8="
									"--outfile data.txt":            "FYp2y8pqhmRjWbhDTfeFNUUMv3x11MglPQjmo7biii8="
									"--outfile datafile --out json": "esk/P7Dx+k+8x5tBTIwxokQ5Yrbr+L1gmp+Gv4nfBmU="
									"--outfile json:datafile":       "m7nmpgGEGMu3Gemz2YiHh00aWlETBqzkW9tFSt+1LU8="
								}
								multi_step: {
									hash:       "0BPAAFARKPO1MFUID56B835R7CIKQRQLBNF3GRM7Q6NN0AUQESIG===="
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
