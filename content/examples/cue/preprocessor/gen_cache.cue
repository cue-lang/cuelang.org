package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9Xw7b3lGMUsvz+Z8pW1iglsnesRDAd4TAoRNyKC3jSI="
								"upload additional file": "b+AmRAYK+O2T/0+33YUrp5jVaZRZUMDHSzIPLJiVb6s="
								"a hidden file":          "ORiCs5icYp/7O+nuF1zAq+XCwFBuRw+U6wadDQlGLWg="
							}
							code: {
								"a code example": "DpvY810mfPtytULHWNqFR0TmsbRrHsiuIXLPYP0k8SI="
							}
							multi_step: {
								hash:       "5SHSQH56DCTE3MOD1PI1LTIPQUAE8VMFO0FOLOMG3FGSSI1VAGB0===="
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
