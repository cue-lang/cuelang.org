package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rrpGhym+4V14EeszV3LQunRGXc7WBZMFGaT+k/ISsdo="
								"upload additional file": "HSyO+LByNwpOmIa1JB4AUcx5FLane9KjaIUzZObF1XM="
								"a hidden file":          "4CCS0lZ2mZIJcP1I3P0R9vBZ5ZucgSOtqyLTQ6fLay0="
							}
							code: {
								"a code example": "SHArn9U0jarNFqdNF1DiH/qFvpVeTcOAeLsdc2CDsqc="
							}
							multi_step: {
								hash:       "MSJJNVVM3EFJL0S9Q2S50LDH2Q4NCNOE3L1I1J46OVAFPRPLNGUG===="
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
