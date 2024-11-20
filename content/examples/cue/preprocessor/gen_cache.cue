package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "J9/RcUhB1iAOEvvUurqVbbbfao7g6V9FFvYBjNEQoik="
								"upload additional file": "cm3eW0jHELoXQh1OilX8NtwEoDMzeaasQyGUBUOjFTg="
								"a hidden file":          "5OV3+Kk76HER5XpsnU6vZkwPFUso7+gIXZVobBtwQso="
							}
							code: {
								"a code example": "rbOIDl+XTSUesMVT1AxiDWMB9vAwYKv2aZ1iC4ObBuQ="
							}
							multi_step: {
								hash:       "J6ASB5RPJSNFCUUOLKERAF0HPFRFMQ8MMSKHMHV59M7EAKJ6A490===="
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
