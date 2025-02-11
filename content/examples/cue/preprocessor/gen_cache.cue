package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "EPTvhgQubggLnv2+ff1wsXfeEWn/HbB7vcZstrNzZrM="
								"upload additional file": "UHMrZpQW/bChtDJL0pB1gq2phiecFQV8XHvd/QRA330="
								"a hidden file":          "AGtfBqJ2OjcSJW5vW855JyrR4fFm5Jw1yPbt6jDXomE="
							}
							code: {
								"a code example": "pLCvXULZG1+wt2D9YO3GjXYl/3EmJ45e+9uSQ6/QJL4="
							}
							multi_step: {
								hash:       "D1A8UVLK9R6B15IMAT57U2731KLTFE2S2H4HQ2MJ70AJ7O0QD5SG===="
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
