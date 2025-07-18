package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "QwK9fDEHy7ft7eR7S1UFcDZ4IU2TchsfD/P7Ul7yNnM="
								"upload additional file": "tKC4EfasU42V0ya8I8azovidUCUUsgUNx60qDb20xdM="
								"a hidden file":          "Hh7i131fZKTKC1vCi8A37rDKrbYLmFuROSAYeq9MCTU="
							}
							code: {
								"a code example": "rEizIW2ARq5eoBnJ13Ktfi0hanKhVzPexKvvf4nEnlU="
							}
							multi_step: {
								hash:       "R48VAD5S6GSA2SUOCSSQO02H82D09RN9K5IMKJOJKH6707L0PQJ0===="
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
