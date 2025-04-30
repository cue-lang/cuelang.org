package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "sD+fQCRKDlXeCybEsGGlSruDYRqmXYFJjfYsLGh3Eyw="
								"upload additional file": "y6pJOw0oQxv2WjTvzGqOssJ6PoIhjLFt0htU2UT8Zio="
								"a hidden file":          "MfX4jCwHzAXeIjlIdASs7QGUB+wg3uwqS6I7QtpZQpY="
							}
							code: {
								"a code example": "BATKCzHsbvT7kH/PF+xQomuJ/1RYny5XqauJTDs9i1Q="
							}
							multi_step: {
								hash:       "1RKJEIHAE2E2IS94I7DNK2E22D6GGI5PQ8FH6CHJLM5Q2K9D4KI0===="
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
