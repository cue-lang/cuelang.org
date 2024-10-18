package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "EY9t91zCU/CBh0qNbNlILNi+gmkacr2sAKJUVrDnZKI="
								"upload additional file": "2armXDPVfj6mQjEMphciACPPVXkY7d15KwxB3NQIl8Q="
								"a hidden file":          "/RibzvidIRBpgQK6x4diuGz1D7os5Z9cbxz40ZzQwdU="
							}
							code: {
								"a code example": "nezrt+Xyjk7GRh9FVZB3+ym2bUYjMqX9K9lNtzyPs1w="
							}
							multi_step: {
								hash:       "OEP14MLEKC8RKR9EPP6QNQEDDUKSQJ8B93ELK33E6DE7SFCVFD2G===="
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
