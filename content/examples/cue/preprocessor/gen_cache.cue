package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/TLMwBKbYJcAAuVmEGTJ8CrbPUW6BPY1aKqTndYCqnE="
								"upload additional file": "wtaaQhTpfhj9RfL5rCWXGcEqO9+llbmWKpZnv0Y6Hg8="
								"a hidden file":          "Z1UYIwyNqNDqjGeSZU/kEcg3p2Ui4HfrKjZzWOuQIHY="
							}
							code: {
								"a code example": "BcCK3UpdM6u/IqhT56Iv2Nwzb7Q8BbpvHaIj2HUjDVw="
							}
							multi_step: {
								hash:       "J1V18JFV1FBH4PQHQ36IV1SQJBOO53IECI9TNOOGBVFGLJA8A42G===="
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
