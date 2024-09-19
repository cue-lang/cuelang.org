package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "TmvH2ORYwOF0Q4RTucQh8Oj5lWHgbeHcoXKGVaISQw0="
								"upload additional file": "QlZNJ5uFtxB27vFkRMbZ3Adeu+36ATMAHTMAjdppA20="
								"a hidden file":          "/6L0DDZiEzNRs/Af9TXhw9Ji4lb6MXShDwWDB3Ze4t8="
							}
							code: {
								"a code example": "NB3kVky1hrAX9OVTXzORm4TEoIinkdfwANkoGnZ9Pfw="
							}
							multi_step: {
								hash:       "LM64A4AP6BB91K9UCQJLVH3I8R0NOTNNGS2NS0RA03VHA5GE8M70===="
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
