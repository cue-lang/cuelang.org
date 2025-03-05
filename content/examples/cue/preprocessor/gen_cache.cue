package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "l7SzQ1uvmXtjI4feZXEPWKHdfVKvs9Or5sYrCcj5IX0="
								"upload additional file": "Fr0HkhBKaJzsJx7mEoxiupnrwUl5J7TqU9x5BmTajCA="
								"a hidden file":          "WkmZ3xU2Wqqwl2qbw/YbPUUAZWxBjBlGcCmY6RBKtnc="
							}
							code: {
								"a code example": "uNzwkIQ8aAjR0hgMx/On86tfVD0aHHSKJGeF3GhbRqQ="
							}
							multi_step: {
								hash:       "M0U2AHVOEFPE08KP3QNMJE3OQJKKJ2Q75GSDNNKT1F7NB6PV32A0===="
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
