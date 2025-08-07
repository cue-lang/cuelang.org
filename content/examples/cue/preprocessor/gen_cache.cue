package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "H+gWR8m5rkFork3fDn/DYuJyqH5QaPJbNhLcq+u4Q/s="
								"upload additional file": "R6std37HWZPCwtnV0Jgynr/oFRQK2bnyTqbfQdeJWV8="
								"a hidden file":          "09N8s90jMqrWQ8fhjrWVGRjy8S2Wuv1PV7hQK7rvoLI="
							}
							code: {
								"a code example": "VCNf1aZUqGlhCPbhaEMjXvZRmEC7vmbfCYZPdKLSGdQ="
							}
							multi_step: {
								hash:       "0JL7VNVB3UUDDHAOCP91BG5RIHHFUC3TGDK5A9CH1EJ4HC0PL8LG===="
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
