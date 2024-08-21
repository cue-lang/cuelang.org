package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "66fUO+IVHKOfpH1OTs/rek00h/vgOUM4Z26BNl2qHtk="
								"upload additional file": "bS9V104N/YbRO5r11VViQJQiEHDy7bm+qBNys7hezkg="
								"a hidden file":          "iUYqh5smCQ9/jNeHwJOdivD60jiwQu31UGHlqRoIwLo="
							}
							code: {
								"a code example": "+t2Eg9alZrqbvuJnk6Rgoro7I6rB8GvCRwSdC05seYs="
							}
							multi_step: {
								hash:       "QOG3ECOHANCET9AR67D855T1ODLMGRG8PT66R3D14PHSG0P5S5J0===="
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
