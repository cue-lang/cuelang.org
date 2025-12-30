package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "R+61w3rsrEP1c5HVm6FGLpjnHlrb4OSv3zJtQzuWuQk="
								"upload additional file": "AP4ZT2iDE8n57SBLpgeJcb4oFZXtPp4pX4n9ALwWSAk="
								"a hidden file":          "C2xaQcWx2AlrERTYiHiFWfkByHKj+oLmIPOu/7w+aLM="
							}
							code: {
								"a code example": "6UHjb/Liadknw4WljUi3uzy4JqNn8lOdYlw7O7ksRiI="
							}
							multi_step: {
								hash:       "MP6MGCSISRCJBPEHRSGBO0IQ0RFF7VMS2LU1694TAU9POHA708LG===="
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
