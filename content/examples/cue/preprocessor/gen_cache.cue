package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "iqJoQ7e8z8McT58WZnRBXgG3dRsQVvKpYprSjngmJ6A="
								"upload additional file": "7qwDShONPqupac8HIwegY+1h1M47uP8jhKexvVIjOH8="
								"a hidden file":          "vv1A9Rb1O5F73niQGxJFzcoPdMqq2hG4PI82GpmZ72M="
							}
							code: {
								"a code example": "EUiTi/dnQjkETsiYrLJn2N1jFxNN1Kl11zDSnQG+usg="
							}
							multi_step: {
								hash:       "Q1TIT7VFQJD650QLK44VN209CLU5NT3HH6FKT2HFDO3T83N2SF30===="
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
