package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "1ssEHPW1P2aMcnwM7rPCHD4fDbFmXmHHC9unZa4iAb4="
								"upload additional file": "z3sp2fOUFKr0T+W1fJzyT2Eir2K4e4STXUtVPckBwRc="
								"a hidden file":          "NGzf/HS53tg6eAeY4J/SO5jcdpfNKaEwNHl2dsbMWqQ="
							}
							code: {
								"a code example": "oF4IumsQI9WeloAfe6KjEHYGMMjZ716/EXIog4FXn7w="
							}
							multi_step: {
								hash:       "C7LT9VMSQ90JRM9R8Q6N5F5RFRBAOKQ6L1N2KEAN00IS70Q896TG===="
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
