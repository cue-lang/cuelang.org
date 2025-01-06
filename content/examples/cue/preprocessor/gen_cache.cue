package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "PWGGEjF2OFOIKQALy/HQ/3SP8H1NMIPsg7qGl3fYueY="
								"upload additional file": "kI52nVU5+eFUOy2CIeeXzNmox8ZqxoeDNcaAZndiC8w="
								"a hidden file":          "1IYxSVrAoDzjFntPatbHKQalnRRCK8y0j8D8xWikvm8="
							}
							code: {
								"a code example": "01jxaY0hlQ3IENUNYE1p4+c+kEx0hOfvUGloXDMXtFE="
							}
							multi_step: {
								hash:       "QBJUP5DQGIAM4NSSVUKTS60I4NL44U3S15KFHBEAPRBOQMVO3F1G===="
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
