package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "xq64J46NEHtXjM5VvHLJwvo4CRPXqFsfkz3GVP6RqyY="
								"upload additional file": "eNSFl3HGyp1RR++o0jGDnk5L6+ur8aTx6ihkD357yLw="
								"a hidden file":          "2yygzjImyzEZq/K+iC6zuBBJSYOwmKih4rXZCaHn7W0="
							}
							code: {
								"a code example": "yGljrw0scMKL4HBPk4MFsO2eu+ez+/JLn080BlDMsoM="
							}
							multi_step: {
								hash:       "87JPFVOH17NHGQ0SVLMNKMEMM5S45ELCORU1VNMC620T6N85F4NG===="
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
