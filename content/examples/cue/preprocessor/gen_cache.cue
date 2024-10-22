package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "H4DVxryZfOxEZ1igQ+xzXZt/C+kOi/X2h0rp6A6RIhU="
								"upload additional file": "6KpFZwRHayA7vFLcK8zyAqIp/Iguu7spYspolR4/xFc="
								"a hidden file":          "3N76Mf8tmsgSTbmdjoLXx3U3zZL0fg5OvosG4MxooXA="
							}
							code: {
								"a code example": "8sBMkVMNIkfQ/XGxkT/Mhrf3IuYeajVZvBsC40tqNJE="
							}
							multi_step: {
								hash:       "AMKOQAGKHMI5NVV530V4VQNBI8489V4N6TQ225KO50759K90NS3G===="
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
