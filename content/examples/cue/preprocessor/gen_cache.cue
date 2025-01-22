package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "gXVUtstnCmREuNKUS0woga5l7MhOV1/eVzuHRtA12Fg="
								"upload additional file": "1P1BWLeBWSFKObciw7j26mQ8RbupAphYDYSRn70g9uI="
								"a hidden file":          "mbK7R+6JQcCQDs3ktrvbzrlFQtTKb0vMrFZafBFRZ+k="
							}
							code: {
								"a code example": "Gt5WlgNCgYpeaKbsaK96dhYEwyARkUilhuv8EemuIbs="
							}
							multi_step: {
								hash:       "BC0J55A5PE02NKU317S9E3JTVUTNH8SJR817MAPLOMBNLU8UMJJG===="
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
