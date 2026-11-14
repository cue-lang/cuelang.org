package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Hog9CAtGRqdEYYLKrxQ6cRDEPWr20WoacZjFcHf3VTE="
								"upload additional file": "pmkkY2SxQM+CasG4HSQxWBo6H2od26GyuACukGRe/X4="
								"a hidden file":          "VpP+zoXEgextCQXoxevd90baGVtuYxPDntH3QBNJ9S8="
							}
							code: {
								"a code example": "cuwJ6ynOt7FymcGQNe4e16B3wCK50UQuusbApSkrfYU="
							}
							multi_step: {
								hash:       "BC8H9780ET7LMUVGLP3874TBUFDKSD9PVOGEA0NAMTGVPF3LCLB0===="
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
