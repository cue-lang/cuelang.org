package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "kGE5v2gTA9Uz1ATPWiGiIs6H6HJDWp6uhoL399XRjT4="
								"upload additional file": "i4whRRnY5cP6mQOw6Q59WovmlNfHN27ucQxo8kaCdt8="
								"a hidden file":          "YmV5ypCGfMBqBjdVo8mJf+NWRGfp88xO+oWoYn/4fek="
							}
							code: {
								"a code example": "L00nmRwof83nVebqEU3Hzn02aE16YD2SDSf1F4PUbe4="
							}
							multi_step: {
								hash:       "6UBTVNV0EKS2NC0TR21OA1UJTUQM66HHM9TGVH7CF0AMN74QV7C0===="
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
