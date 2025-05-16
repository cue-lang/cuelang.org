package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "XMt6cUMBh4/bB9ew1IS0Ja/n5G1/30/j4rJDUbMgSS0="
								"upload additional file": "zbxubDB+oo1gwB8BBx/z7egGxHRJwP2BrqvKRKRzV/c="
								"a hidden file":          "xWf9wO84BoxjeAOuIIOqdS9AMz1jQ6NYbpYGJoTU5Q4="
							}
							code: {
								"a code example": "69SUxun7PVFqP6eWLsn0l39NEGRi+c5wcvmclxn88b4="
							}
							multi_step: {
								hash:       "LAL881V5RBAJBJU8O6TPV2TC86VLH4992VGB80GPEJNTA2NOSQOG===="
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
