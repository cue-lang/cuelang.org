package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "8l0HzOoqM+B7m97KwGSjsI5qT4RCwcKpWgbTZHcl+90="
								"upload additional file": "kvcPOb07Q3ExeIy9rVRf6o8aRdgOsJ/h3cQiqk73itI="
								"a hidden file":          "GnGSNt8DIpwCuBdbJ5PmzeVGtm2stjxJ3IYUWxNjvII="
							}
							code: {
								"a code example": "bMRJM7QZxTfAjStePHpTzyZKaFiuZyKnasiW9KE59SM="
							}
							multi_step: {
								hash:       "4LQBP7EVKKSHLP6AA90T1AAF5ET4RANDAGGKQ1BI81FREPG4531G===="
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
