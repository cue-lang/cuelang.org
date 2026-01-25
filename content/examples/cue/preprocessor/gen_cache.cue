package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Wqvg22OykniFB7S+gakCp7RlFyyrb48vhKw3Sjr3lSs="
								"upload additional file": "SEK+qswtYfTnJK6TEpMIi2zgR188Kuwf3i/fyfX+2hI="
								"a hidden file":          "7exbAHAZZC0X8huMCDY/+VWcH0auU1CEM98u6t3gf0k="
							}
							code: {
								"a code example": "zXy8gDAmeG23a5wGYQFzZqzNw9REEYbq0zBS3WRT8oM="
							}
							multi_step: {
								hash:       "KM798I457692B3BBLV0L8O96DHR4LEQGCLJK3LNAI2V61QKQKCUG===="
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
