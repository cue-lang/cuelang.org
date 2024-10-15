package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "xLsZyFFNpQ91OqbN+1CMGFLAWGlqgTPELk7ZhIYMBRo="
								"upload additional file": "VkvacUSe8+SRJ8yocSehksyA7WzMo4MnGZ/tIDSHKAY="
								"a hidden file":          "ezySI6CrQ4Jv3yJ6okQfv5LFq9ZmnI177nRYKQmKpaA="
							}
							code: {
								"a code example": "iN2gcIkLiJzSCltHqH2csjrLgpJmLyIjfPOG1uCbeBw="
							}
							multi_step: {
								hash:       "BV7OP8K01CUPV70TQ7KSU6B2FD2R9K1VPRJFJ1OQ8K5CQ8UUJS60===="
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
