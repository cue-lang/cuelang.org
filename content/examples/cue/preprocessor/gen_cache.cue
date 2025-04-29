package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "q/saugxT/TgrTADp21JOyN+u00294Tj7ysbWieJkmMw="
								"upload additional file": "C5MN+EwCblFeM6pzCitfmA3CRV/ADvTz9TH6Ogl71RM="
								"a hidden file":          "9In5JtFfgq5usnRULQwnbhsXcdXADhbtGKzabr4ZCkU="
							}
							code: {
								"a code example": "fxp1IPP6WVyrH7S+JE3JN7yYDFLoHy9KUw1yTsCCcJ8="
							}
							multi_step: {
								hash:       "HE6HV63V0RKVFH3QCEILDAF8SPT2F443O9QGPB3GB0DDJHL6EBBG===="
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
