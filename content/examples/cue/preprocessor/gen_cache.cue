package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "gvOkUK3344UoiCVZ/Bl9sbvH/4RMqYcXdsxk9a4lzAk="
								"upload additional file": "ayOpmHYzhHNCX8GPJtLaUrQaQCCsDXZdizQlqwNL1F0="
								"a hidden file":          "lv53S8UN2oPN7BHvpULGj1FH/wMi7enuqqEt1NLVxYk="
							}
							code: {
								"a code example": "QxkTiAek2k+bJMtL5v4Nur0vOWjdfU7Mcx8R/st2qz8="
							}
							multi_step: {
								hash:       "91C3GEK993KHML5D6UUQF2KIAOPF4MHMGPLB69FLEU911Q9NGVOG===="
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
