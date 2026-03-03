package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "TTW9Ys7D2GatlslD3PZQIvq3/InIxO29N3BbNehVV8Y="
								"upload additional file": "uxXzx6vpFIiUduD+iOD6dc3AEekpxox8bku5jH9T7Io="
								"a hidden file":          "qNSrtC6lf3GGL9Jn2z5XH/b9mhJnJAQ1LYR8CjocHfs="
							}
							code: {
								"a code example": "Knr3Rkou7SZu+aoy8kfvUJYCAK/z8sxAsMyds3CJFss="
							}
							multi_step: {
								hash:       "NHTIQ439KV6HIFIIT4BT32N9NEONP9BOKEFTU2H8RJDQQFM6KPV0===="
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
