package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "QiLGh2VjlbfK3W4QCZOd7xthaVz14bsetFKKUCgzgkU="
								"upload additional file": "IqcTAQLC7OwfsFhjxgycXDw9ahlvkCEAmW75AQc/gUA="
								"a hidden file":          "NyBXyB4a3OlKaF7u1/BAB2qG9r8XvPktfN5e8WfdTg4="
							}
							code: {
								"a code example": "i9xx0ptkEnpY4f5m54LOjBF2M59NmmTWyImRAsh52gE="
							}
							multi_step: {
								hash:       "T4SHT1KLNQ70OM78D7LIPJ5PI16NKQ0N1OFGM5LKE461855MIGTG===="
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
