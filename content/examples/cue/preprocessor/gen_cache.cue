package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rY5n66DQURbNovK05NS0uDYJUxUS4bolY6GlFlbUiwY="
								"upload additional file": "WmZDMw37HGGeGIjp9UXPzlYHpAGpvfKNfdU/o6Y4Irg="
								"a hidden file":          "w2lwTYuJDkhXAtxaFqEmikrVYJj0IHHmOYB5tiS89Aw="
							}
							code: {
								"a code example": "4faJaSjM180NU7VCCeMKZVRkVP9uUSGqYsYgQm9yVHY="
							}
							multi_step: {
								hash:       "K5NNMO53LQ8QB8JAGJSQJPEIC68KMCR7GM9Q9F27NBVBCL9RTCI0===="
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
