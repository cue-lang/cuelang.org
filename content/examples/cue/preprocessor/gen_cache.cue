package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9VrRpjxmPkYo4JXFy9ijtsVgFZw4j/SKsU+kCV585tk="
								"upload additional file": "cEj6wRAfFXL6y5q39FHJFO3TZtciricUrXiny+0ye5E="
								"a hidden file":          "HkQ2aiVgCSmVimGyB79N+zY1rlWbn3oX4PPqWfBrqbM="
							}
							code: {
								"a code example": "uldpaTo6t1gqKSD4MII0xuOa4NQk6+4/qGbBy80YYcI="
							}
							multi_step: {
								hash:       "M1VH0UOB3B04LJ75G20FC1UB9ERG8GCRUAT2TVL90SM8H47CNR30===="
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
