package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "wug2xWUvvKuNLQ+1mDdw7A3huim29UROJcNrzhdn0J0="
								"upload additional file": "SjVa2t+s84Quy1EeNdB88HVmGtss2SMvFk1pG34Ys5w="
								"a hidden file":          "ZsEpsGzbC2IuvWQWxzUT1oX31m+M9CcbR1sqR56rzV8="
							}
							code: {
								"a code example": "eJ8ChWBj07xL1vwl40DA+sSUfxXENBCHusL25UJJC6c="
							}
							multi_step: {
								hash:       "G1DOOVPQ4EHN92V7JQ8VGVJ3QFS6HDVDHG5MBKHGIOUKSB0P8IU0===="
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
