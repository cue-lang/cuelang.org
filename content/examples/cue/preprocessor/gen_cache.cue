package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Ya60XjzX6zTW3pnne7Fz14/Olb5VSX3S+zmeIIvKxBM="
								"upload additional file": "Ba1wdGBxaqT9IaHPjTun66xI/1XaQibgUwW1KpSIXPY="
								"a hidden file":          "JYUeM6UWe0Whg2glsktGe9lGbJDPzp+l8H7dswNFsEM="
							}
							code: {
								"a code example": "DM1tMwVaDnyoioBAN0qrGBAXfgSC+U7t/y9cCUyXQFQ="
							}
							multi_step: {
								hash:       "MJ4RMHAFJF2PRB631PR3KO2CDH593V6AIR1NA77RLGEITHT09POG===="
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
