package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9hzhW8w1jwvQjZK+rIkzYvgQbhbtQb7mHiooXih3o5M="
								"upload additional file": "DxfREtIBXfxkqrGgaxRI/1hcfwYZ9En5xcz26jTxab8="
								"a hidden file":          "fXMTk3/wRBPlTsisFVf8NtH50f3iPQw54ekaeINCKdE="
							}
							code: {
								"a code example": "XT/6YyFCeUrcZM9O7qu+VkDArM8hRvUlJnb/PrNN3pg="
							}
							multi_step: {
								hash:       "D39ABN37QRJVSL74PPVRGGVHS17VB9GTJ7UP77V35KE7JA8UN760===="
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
