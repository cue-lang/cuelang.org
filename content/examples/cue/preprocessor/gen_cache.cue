package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ZWKGHn4YV4z6vZS/NnZANpcRlzjTWv/XxO+ypQwsRzU="
								"upload additional file": "OpGbJ2du3O/5E/ajKjWtIT9OXXW7RhPKttHPnHKX//8="
								"a hidden file":          "yzNF3PO9hpWFtIHTWmPe+Ngv772ggLHKsaq1H5xhAdw="
							}
							code: {
								"a code example": "v4/HSAigS/LrTFlpToGQy+kSkjhUXn0PdcKud218rAw="
							}
							multi_step: {
								hash:       "N3V7SNIN3NR5QMTAH9VHRTBLGN91337B4103FQV4STION3140FG0===="
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
