package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "8Qt/aSfnBgEsIoErkwb+mFlwQ3Bbk0Nh2jQPEfa71fE="
								"upload additional file": "x8Oi+Lm7oQixt+SBsYwg9GPOcMrqfhDMN8JCNpTh9Uc="
								"a hidden file":          "ADdSimu5FvVf2MSMU66FPN4ozCg3TJLYqzGwdPdCXzY="
							}
							code: {
								"a code example": "aRuGT3UdQNSFfrH+fYmAqHvQR4FcyN7M2pABJ2lzwFc="
							}
							multi_step: {
								hash:       "OUULI8LPC1UQN6HUR00RO50TJKS4DSAI6CEIVEVRG7436RCI2I90===="
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
