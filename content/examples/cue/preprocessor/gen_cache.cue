package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "M/CwOFIhMts2XZ+bhH/iIQkkP0mnlKFwm6LOvofUCF8="
								"upload additional file": "zkJwQTJYrDyTh0TV5tRI+iZZbBkElEh1s1fCtikorGs="
								"a hidden file":          "VR/YJZWJFeRg/L9mzQZsjrl8jqFJAwOdrgSkVoX4WZk="
							}
							code: {
								"a code example": "S7eVlt6ab/kc/wml5+M3t++qQlh6AcG4JX5aqbkfY1s="
							}
							multi_step: {
								hash:       "MTQCO89CHSKRKQ5BLQT0ES0AO86B2HUUCFUGMO8C6JAVALFGIV3G===="
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
