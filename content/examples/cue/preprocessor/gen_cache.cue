package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "8+QruUyqNa4kbqiJO+AJX+Uqk11JbaHHrF48dmIhtWM="
								"upload additional file": "yD7oTmAjgaRJ+3sxz82xuq0EvpFqfi9nGDI3gLN3UvM="
								"a hidden file":          "5ddiYN4syWz2N1tA84sBYlHk41UvIBFNlmpK1UDTqi8="
							}
							code: {
								"a code example": "72PWqNhi/a/pRYAkzBbOS8bg8Q4OTF3gMEfKjCT3Ssc="
							}
							multi_step: {
								hash:       "C9A3UQPO0CUD9NR3TPNAF4P3TL4RT9H7ROGIM06F2SMO56LBUQ60===="
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
