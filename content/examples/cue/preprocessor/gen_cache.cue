package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "A2VonQzl6e17f1fXX4GaW5cNSBlp7l1N4RgFliIiUjU="
								"upload additional file": "ZeKdPx+N/Lwn2G5JGusjCYmQBkvkeDgFB3sz+/HMMWU="
								"a hidden file":          "N0TW9ynqTpjtfQMB3CU3qs+AwWqpoERlynntFSZJl4E="
							}
							code: {
								"a code example": "i5wSVrVECmUEbE6ySwwEOPWjeXnF3GO/JFIq5lGXb2g="
							}
							multi_step: {
								hash:       "BMBDVK9PJ09AAI6GOF85VL1A7HTEK3REA5KALB93LKI18OQCPG6G===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											x: 1
											y: 2

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											x: 1
											y: 2
											z: 3

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
