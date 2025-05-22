package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "uq5L48qn5qFEf+W9dgtk3BE6Ukd7PoPlq51aYigbbRU="
								"upload additional file": "DIyCfMR05EFFcS3mtHlVBvzqcDadinbFXJCnmUa/85I="
								"a hidden file":          "XGD2XGWA6OF20Gy0eWfNzUwfHVIgUmI/YkMu8lM8tXc="
							}
							code: {
								"a code example": "iPj1SBh6G0oSPTOmk3qj5HjIlHe9RzrSqP2BmThc5bQ="
							}
							multi_step: {
								hash:       "U7C0CSS335CM0MOJRFP0OANVV9QJM34C24U36VBO09P50DPNH2F0===="
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
