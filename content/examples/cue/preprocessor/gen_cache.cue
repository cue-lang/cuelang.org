package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "CDEbNEEWp3vajxOUObr1KUgh3H4Us542YOyElS0eu/Q="
								"upload additional file": "Ccxt9uyJfgtGgdigpZTFI1ZnkvsmbLGqcgcizjVCoyE="
								"a hidden file":          "JNbCAhj8Qy7eBXO2vv+0lkvrXMBlMEDu8WFxv69lTjU="
							}
							code: {
								"a code example": "PiOt6HY2XlSSQYVqwQk5CthvCQg7hwoOyqCbT0eFR0E="
							}
							multi_step: {
								hash:       "4GJHILFBTNA9VQD9RQ5A3TT4FHRJPMD1V6ARDQNUEQVNCH0CE5EG===="
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
