package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "NTORseqaRut5y4H63BPKIlWYyj2+Tksb8Ak6plSMkgs="
								"upload additional file": "lhyBT0K5noWmRB9cYWi1STkwbPmrREaVebHseL2fzSk="
								"a hidden file":          "fQq4dTq+QAB87go0SVlW5S16DJPz9WI0DUcLIFIhxKk="
							}
							code: {
								"a code example": "NU0Wk4DYh9R7BKQYbRCUySpcUBinRYhgFRLSRPabfn8="
							}
							multi_step: {
								hash:       "3AQNGUVIVOVORBUQITHJA98S0458697VI1PFV3GRVVN4D9OUAOH0===="
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
