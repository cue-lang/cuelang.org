package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "p5F7iCs3gmGPoRUV/LShSDjQfrlxogvnQ2PFfzEoLuM="
								"upload additional file": "teKkwEbXg3TZ4bZpPRA6ZBjAm3/7AsSnAmTRQ9MUmQk="
								"a hidden file":          "sGIRW0vuUpy6xUlG/AzpXoAf77nF7wVLSGzxDxwR2lA="
							}
							code: {
								"a code example": "CvAXMTavgXkMTEL4iuCbsHhsYAdduleWTzPBEvB5Xlc="
							}
							multi_step: {
								hash:       "0SFIC74M89IQH42IEARK751MCCH1FVO9ULU6P5P81HM4QMB930DG===="
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
