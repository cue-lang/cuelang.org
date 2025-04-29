package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "qtERiVoPUN6KTdF2G30JU/aHW/f/MbpWLruG4rmHhw0="
								"upload additional file": "XQfI0VCVyzNQfHFKLNXAZrr82FXIfT9wWdh4TN1U3KY="
								"a hidden file":          "QMEg7NlkHf/KWAGIpm1UXyAVYB7ySYDZUCuFjGS9YFE="
							}
							code: {
								"a code example": "wttMSXUzDObfSaPVHfbO5wK3LiyXpJhnglwDMeyFjno="
							}
							multi_step: {
								hash:       "KRCGL5Q3U9HJD6AENVEDOQ0NBA8D52JO0E18D6OGU59TU30JPVA0===="
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
