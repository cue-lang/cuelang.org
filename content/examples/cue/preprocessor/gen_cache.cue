package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "mBtexlJCLUaJGbKsQ6wyGE0RnAXhYGzF9ayY/P749ks="
								"upload additional file": "QMQOBPGu++jHdyeKaaznGVctFHo7ONTYs5cU7paepr4="
								"a hidden file":          "f+dMbtEABg+qUChHMi48scfbV6MwkFj0y1fsJEzI3RM="
							}
							code: {
								"a code example": "HT/57v3hxh8WJupq+HSWbP1uBZg409L6peA5kGVX+Rk="
							}
							multi_step: {
								hash:       "HIJJPAQCIS6HJVJRB5MT49RUVMV1TOC5AHN7G0GEIQ8EIT61KM2G===="
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
