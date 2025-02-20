package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "k003wBvn3h/quUZR3+p++jgiG8ZlOPlToytULD+LIjk="
								"upload additional file": "hIjomlF4FcMbWiGnqG6FNMFuflrFzdc/Af6V6Fb41/M="
								"a hidden file":          "WcsNmuXWeHi0MED2BMmPUR/jtCK4kHD0AA1l2Q9b7E8="
							}
							code: {
								"a code example": "HWFWuSAZo71WLPnDih/KgKRzADmIZ6STX6pp1WapkRU="
							}
							multi_step: {
								hash:       "0C4OEDHGO8SC5A11SRCEMMMPVSOLHS707M67MK9K5RPAPC3DB560===="
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
