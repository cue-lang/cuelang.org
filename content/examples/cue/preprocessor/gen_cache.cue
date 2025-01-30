package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "7kR2DRBvKrkBAOxvJ+MyxkMHCU538Pkgm4wtl1j3fbM="
								"upload additional file": "l2Ug0E3urFSQBhRwClVtpRxYC1MNZUtbgAG4oU1cNFA="
								"a hidden file":          "szJHnmvz616UFJ9+o53IU4bCter+wlxIDmSR1uf1qJ0="
							}
							code: {
								"a code example": "RPhS5pYlJYUBqCh0wphEVI56D7QaqD+Dk46SCnVpwqE="
							}
							multi_step: {
								hash:       "ITBLH9IO6PKJ4S672TETC4BSSUMHI3PCP4C60RPA6VSHM9J4MM1G===="
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
