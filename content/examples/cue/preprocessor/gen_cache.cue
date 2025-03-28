package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9cMahV6S5EqQYKANKXY4Ux1lQ2e3ZwsfWn+VyOySOSs="
								"upload additional file": "1O+xe9HYSvysrxbVlcQJ49d5lSOvxK6JhAMqBr9zDEY="
								"a hidden file":          "92Sspkk80CyhdV0mohvFYcbimKZGaQWTJhCarHud3Ew="
							}
							code: {
								"a code example": "g7VEu4836Cde1jk1XVTC1jMWzgH/0NkN25BG80uZBMw="
							}
							multi_step: {
								hash:       "GSRDGCSCK85TBRO2AG5LDSA26AB2A01J8JOHDH7QN0UO6VLMQPGG===="
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
