package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "7DJ2D0Cyg/SbdpUZppJ6E9eMlDeK1F5i1kvnj+52Ams="
								"upload additional file": "B96+PM/v/HO8h6stnHcd7YNdq7qkuAMZDyi2BfrUR9g="
								"a hidden file":          "SkFJzyHWpYxpxvd3y1WmH7bQNxqdGrpgKwQ2SXuYzhc="
							}
							code: {
								"a code example": "+gGwtUJnFGlQop3ZZsvVAa6wh1y7lZxCae9HigZvgEo="
							}
							multi_step: {
								hash:       "9TG8ONDM20GPMPKS9K1OSF8930GIG608LGIN877BHJBMFJAHSFBG===="
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
