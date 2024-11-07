package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "DZgiHBx1rEEj+ODQvpCc94/djpvdJH39Csv6ALm+W2s="
								"upload additional file": "1dyZ5By7fhdGNMzCDqztslxSei5ke27+BHrz9S93BjI="
								"a hidden file":          "scFyM5LqZRj/Hj29+LR+ypp64jsjcXeg1LBMVu1b6CI="
							}
							code: {
								"a code example": "gAzlBLkk86TNjGJ+U+SMV9bXv11QSnXVAdepfrT3saQ="
							}
							multi_step: {
								hash:       "5BAOM3PSL9KI5NJGRILHDP82CLPD2EVNKF4JN7THSOL75TIDJEU0===="
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
