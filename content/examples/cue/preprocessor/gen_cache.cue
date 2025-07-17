package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "dZM1HWPtNqattJ326P217c7FRrzWbQpRfuhG75kzsyA="
								"upload additional file": "VDAhsIdXKT51MCrz+qQAIlNPXV6V0OJx26ncHw4Y2UM="
								"a hidden file":          "pDe66sBgYDjfSUCSeZ8wDU9XoCeOhqRLBzHMc0WYD10="
							}
							code: {
								"a code example": "OB3PeWiz6y4aSRvSXJztY9m2sdoh3QiaBXSsu3pZ2kc="
							}
							multi_step: {
								hash:       "O51CG26N45E73MCHOVCGSOE0B7O2OS02LPE7NLEKETK17TLD6QL0===="
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
