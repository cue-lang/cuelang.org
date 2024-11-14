package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "1qtFE+EGNJNobwYumD/YCkBa6nePo+nY0qELVO9ADLI="
								"upload additional file": "rrJ4teArquqSFyNVE/dJoMMGkIhmWFRgsoQnwPQExR4="
								"a hidden file":          "sC2rB0ID5+tcwSKF7gSa4SIDAwVcuTIVWmVm1ehPdvs="
							}
							code: {
								"a code example": "qBFWDwpO8tm5rqpVFAETz6QdbUtU3cYFgWWtVS8nZ/4="
							}
							multi_step: {
								hash:       "MKVQF0U4FFGEC4H9GQL7LTL5506M043TEAUOLBOKJMDN6CMAN9RG===="
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
