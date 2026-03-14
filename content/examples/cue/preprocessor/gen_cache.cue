package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "4AYtTXW5m3jTefNhOKezHQGM0rWsJxIuMy4Z17QCbbg="
								"upload additional file": "gnTJL3uXFQ/wffVjM6/4ocV9/b4D3eksyHhThBEsdDc="
								"a hidden file":          "MrGC2FpoVyBZr4bTWi1jOh0DKhq6efUuysKvmnLDWXs="
							}
							code: {
								"a code example": "XEFzU7a4kG1lIOes6K24i9iXWbyA+nl0sfb5m/un998="
							}
							multi_step: {
								hash:       "VPVBAFJQ6875ONTVFV7VDE7OTI2E0JQ982GRPM9DAEJARBRTOP00===="
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
