package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "lqnCX5ujm9m0fN9U2345xGlQsF9GO6ckZkU+t70CXhc="
								"upload additional file": "y5t0JqJ0+Ig0uFFzxB4jPKXG9UC/ysFva0N7fnl78F8="
								"a hidden file":          "Z9Uhcetgp72npTPOr+HhnWTqLfp1uYZYNH0Q8DFntxw="
							}
							code: {
								"a code example": "yvmg01GFh07HJyanvQMzJy9o7FSUQ82fzQgNW4cPXIM="
							}
							multi_step: {
								hash:       "G6DN3R4TA37AVEISULNATV7I1RITM0O4FQFGI99JVJK4ANB6SOMG===="
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
