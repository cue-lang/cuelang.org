package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "4VHFiGh5dOjvaXBiqmCnyxlr+hAkGh9ye7mkXuiQmyQ="
								"upload additional file": "jxI8v+g4d8YB8pGdcKk0o/Asq+TdAomvmaWXLvW/EYI="
								"a hidden file":          "ayPi7n1bbcdpf9ZI4NoD6VxXobLXaSgRvs1+Hu57qIQ="
							}
							code: {
								"a code example": "7zEpg5TWXGzAM7EV4Tuxz0jTLkqB8k+07thvQ+fRHOo="
							}
							multi_step: {
								hash:       "1A4IO2I9V5M6FPCDDCL2H5RPF0PEHP0CNSQKVVJSDTVC0L9QC2B0===="
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
