package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "5ciiCescjNjSQNEfApNFwKJoTfMKaj+6CM51oMNlB+4="
								"upload additional file": "cIPST+Z1BMvlsKzUCqq9ECpZAyzyVeiRhAoyy5kVOdk="
								"a hidden file":          "wnIQNPzLdbkurcZ0dIc1bDVSrxUalEfFZGF6p7RF26g="
							}
							code: {
								"a code example": "PLw2kehRlo4NRs1kh1+oyFqJuIQ9VP1pl/uQGHqn12E="
							}
							multi_step: {
								hash:       "UUPCJAQOUNEIT2JO6OB26SP9KC2LV3NH2M92PG990OC4HHMFDJEG===="
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
