package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HU+rAFrwRTazJKEcBM4uZXII0b+TraqTeLJsnI0NsZY="
								"upload additional file": "lSkwG7qlzMCzcM2d4zN5CW5eyZX08rSksu0nk+EDtfw="
								"a hidden file":          "32uHzz22oZL3t6n/6wzZkjdayBX3Vz/NlXbNTUFaS/o="
							}
							code: {
								"a code example": "qU0VqAnB0ZxZCATGmTlQa3aVpnhqWCuzBlJSG0oBPis="
							}
							multi_step: {
								hash:       "I2AM7GB1F8FUDCUIP9SURM6KB7J8AKQBB6F3C3ITS7DR3CM4I7OG===="
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
