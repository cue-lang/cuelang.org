package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "MN73dJf047p7BbFpASbLKKdpA/U0orko1bZesm3AGC8="
								"upload additional file": "aHiGj3vQzMOHJRCA4zySZzkcvTBp2gJd2pGUCRF/ce4="
								"a hidden file":          "EShZgDQFAlVCIMCS6mNfSjdQAA9ah6aU36ElIO3ieag="
							}
							code: {
								"a code example": "rNEuX3UPiSRMTIQjnf8xKiybRHtIQJ6luvfxWBGniVE="
							}
							multi_step: {
								hash:       "4AH9BT9DDJEU71NCIA921UT1UM820DAM578H16VGIVH7S6QD7PKG===="
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
