package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "jftASzGYAh2dGrDY1LlNpLKQft2e1/G9kuzH0rkBwIE="
								"upload additional file": "ZKZOxKvSUM7rXrVwGkXIacou5m6G6HcjoQdOasybT4M="
								"a hidden file":          "chjx34HpYfkGkQS5lnopT6l71PUM3kTLum+vcL0HnmY="
							}
							code: {
								"a code example": "ZW1YJwhT5aYq8s2PJ41GmzPjvdNjYw3x2yeeGFoqeCg="
							}
							multi_step: {
								hash:       "2VIS5GVIVNDB505C7ECNO03RQAFNV4GUPHS4Q4J482UTANGUL0T0===="
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
