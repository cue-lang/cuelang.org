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
									"default output":             "jbDJNW6BA15ZXmFtGcTythvdf0b+3j/a0oxdr94dTYg="
									"stdout yaml":                "Y4OJuAPstjymEpZGLnoYt+dMawc4WaqgYRMlSQF3w5c="
									"yaml:-":                     "23b0fQr+LMbwWem6pr7VrHAVuYuUFhB17iMpyKC9eC8="
									"--out cue":                  "aR7Jf5C2wLYKMmbx2XvGOGOuinTbxqEieeD0NIwDi9I="
									"--out cue no hidden fields": "jL2cEaxsNEW4B/7Smov9YQw8y27kD+Qcaq9XWAIW5WQ="
									"--out cue --package foo":    "U21qyNPUkG9iLmM6ehR7EHyfZ+hzzrkt3UOtrWrWGyk="
									"--escape":                   "L4/u10jpUGzHji+9ObzS7EO7OIt3Bj+BrPsVa7Q4pac="
								}
								upload: {
									"--outfile data.yml":            "72z2XFS5iuqtdbxmbEsuD12Jj660wGbszEi4vojFXUA="
									"--outfile data.txt":            "P8SRKRtu++S4hEbvkpKnemEL7lyzpQtmbfLLpgI0JaI="
									"--outfile datafile --out json": "kA/SG6tlEycdfUVhz61qKyAhN0rezKY/BZ1LbSyM9Kw="
									"--outfile json:datafile":       "NiKjHgcvEonzwTXSD0o7pKP00wC/WpBtgq+uLtdn1Nw="
								}
								multi_step: {
									hash:       "2G14HODJE84R7S4H0RC7ECCJ5VMKF77195T6OKR0OGNUDH7EHO90===="
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
