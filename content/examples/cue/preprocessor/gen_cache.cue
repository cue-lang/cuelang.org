package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "R0BFbGMaV9u6ZuHMNwj0AqOwwGH1/+Oa7+jMQiytaN4="
								"upload additional file": "/I2qGSlRkjRbclbc+HLRmQvzGK+UcBs/NCn06HVzYAo="
								"a hidden file":          "bhYNa3D4cm1rdWM+Td3LAQTKJIy89q0XXFdHDQ3/EOg="
							}
							code: {
								"a code example": "BhojaTbnRhFO8D3SeJReIekuthLhCotWsp4lTh4V3hw="
							}
							multi_step: {
								hash:       "EC91I0LUO9FJKCRNOJBT18DCIC5RHSDHGSTPS2CBNPURS304J6RG===="
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
