package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "mJ1xM2DTm9AdTMqFJMrqiSrE6SM/n3792fF50xpSMSU="
								"upload additional file": "DxlhMJlnCkMgpWO792nw/0vkWy5psmQ9L19hjvifcws="
								"a hidden file":          "X1KHAhMXk6cduS3P7Ya3hUHy0tGLzLSZWw/oWmqEckE="
							}
							code: {
								"a code example": "JBu9HrT84tZ4Voj4X7219iwvWdTl4invWM1c1KKJCj4="
							}
							multi_step: {
								hash:       "S1NP8HE1BQ96UG7U9B6CJBTVGVFA9SRDN2P322R1EM1PP16U2A4G===="
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
