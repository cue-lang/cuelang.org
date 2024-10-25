package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "K6PuXO4q44sRIcp1YvqrIop2Ce4LoTXdef6W7ZJAavQ="
								"upload additional file": "LTXBQb5tXUVXBuFqjdyi2jMcAPi8+s1o3+RI7h+24Hg="
								"a hidden file":          "K5+2J0vpQJiAIi0PXN6wy1cak6WI0jQuwSENu95cDqE="
							}
							code: {
								"a code example": "2mIO3X519qh4zX2gTjnmYxB8lirO1IBc3znt02osyv0="
							}
							multi_step: {
								hash:       "O60MGQ9U9DOT8GD70JUJVTMMBGG8832OTG7LTGUB07IG1G574FHG===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
