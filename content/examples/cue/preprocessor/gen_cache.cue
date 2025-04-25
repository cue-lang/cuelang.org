package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "if2O1x61zFQJfgFCb28YNcHX6mFaj1U2xEaG3vKo/pg="
								"upload additional file": "vamMT9oBbVMVjcGl6yg+/ehoqmBs/pwTg+h6hYdAX30="
								"a hidden file":          "Sd3fG3r5UT7eutVhZG4LLkMdUAnn6b2o36BJRqvrxrc="
							}
							code: {
								"a code example": "w++rU3kwxMypFrXQwfQpaJ9UVOxG0futS48sfrWSQU0="
							}
							multi_step: {
								hash:       "J9GBMH49FO4LNPKF5Q0DP9HH1841FCL6GN74LR6401L0PN07OCI0===="
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
