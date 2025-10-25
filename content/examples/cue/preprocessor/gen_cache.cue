package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Y66mS3rV2ng9NuaCPb16uTjGjMzzz36Ju6gurT0XCQw="
								"upload additional file": "QFtWeFX/nDXyTEHJ9n5AckiFCKByAL0J8fGY41mQ3Xs="
								"a hidden file":          "HFZLHN1EHu5X1Ce7OocoOKtQXfir1EjTi6U82QQnyCc="
							}
							code: {
								"a code example": "aKxcB5vXi8C5UkiPA/T7n/gqk9hT48ru/hgq0KQeFX8="
							}
							multi_step: {
								hash:       "L1F6PRJI2V6TNMK9CPCT3VLQO1OT99EC378D7E223VAN31259GLG===="
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
