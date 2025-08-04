package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "2U46ea+2bB+btI4tfBZQIO6S73TwvfV8lxkXntW07NE="
								"upload additional file": "Z7Ww82vNPeULGafgSLq2/kPMS7Gvlu8v/ABbC4X84f0="
								"a hidden file":          "BjP07wNMtkLEsnUwNss31Lwl2xQawiYxh+4tCVhNGjM="
							}
							code: {
								"a code example": "23rBhGF2bIwKlAlFMKI3/vIiburEwgpUXXUhxhW8oL8="
							}
							multi_step: {
								hash:       "4OBF533VNJ0F452903G2GT20E6CELBEPL1C8EG8O6B85E1832A30===="
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
