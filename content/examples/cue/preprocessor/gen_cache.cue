package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "MrmvfE9T7vBkraj1h7e9Dd+nimfO7lqN5QhTuKYuDRc="
								"upload additional file": "xZa75axBYn6stOQrpsiWo3DlcowF8LWesYMrwXWATYk="
								"a hidden file":          "t5YEY687D5tVGfR0jX1emHh7YmFlW7EjqmPQQuedifU="
							}
							code: {
								"a code example": "WirDA7KA7drCXcLCUwhARjwCFeWCBl1rdTW4NxX3qlM="
							}
							multi_step: {
								hash:       "ORRIUR8C7CTE7QEJNU7BKMLVB3ELE3QDBUS2VEEGCQJ568I6PHNG===="
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
