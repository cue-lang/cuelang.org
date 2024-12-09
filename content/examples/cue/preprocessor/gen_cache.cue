package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Suf/DPaskemZVyfR4MSEYtohavvkAkt4uT3KBrnCu+Y="
								"upload additional file": "/Nzy6I+XLYam90yNomu3ns9peOI0Iczy+KeguFty5Uw="
								"a hidden file":          "VBUFCpE3DJU/X3MInm8wUjG/Ry5Wq1Y1bxUtPoJck9U="
							}
							code: {
								"a code example": "F1QOCoOZKUpbNJ0TNEqmp95O4xSExXqhwMc+wT46ZhU="
							}
							multi_step: {
								hash:       "162V3EGOJCFQ65KA7J99MJ6LSMJMVV83VADOP5HMCS4UDCEVE8CG===="
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
