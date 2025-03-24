package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "zPb6xFxSIXfhpuULU6j+qwpiQNREbZj/ZZUPTzUyebk="
								"upload additional file": "kvBr5lZ34G90AC01yxRBQtDdyOZYW6wjoGzJr0b84es="
								"a hidden file":          "pRna1LfTdmN/ylLr95OatzdpDRD0ETzp7oryzUHQeII="
							}
							code: {
								"a code example": "8ovoNQ4mjeG74XW81dMrGpzL5Ql4AJBOFpnrH9sjoiQ="
							}
							multi_step: {
								hash:       "0FUST2HJL64CDVC1U9NVOCVODS24HTQ4KEMM10ESGR6NKM071U3G===="
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
