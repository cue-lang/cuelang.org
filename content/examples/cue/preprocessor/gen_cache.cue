package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "6D26a347A4T/GdEFm03tYuZT6laHhPZdkTt4gn53Ij4="
								"upload additional file": "x6W4IOcq/sbjvVdgwbQc6mbDsI2jeS6zWNbFhLvvrvE="
								"a hidden file":          "QRAnDJAiokvDW2FrLw4d9hMAIEoV29Q03ptvOCye15s="
							}
							code: {
								"a code example": "SEpRqVkIKW3wgPKSEqKUxXHYOB8Akb4fAAMbc5kav+4="
							}
							multi_step: {
								hash:       "8ORRAQGUKK933ISPSDVR2CU38RFU5SH0QCHIBS277II2TND2V5EG===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
