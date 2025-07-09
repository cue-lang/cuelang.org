package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "go6qQlRYvvhkLtloINJcub0EYGliwO54YH9nvelItec="
								"upload additional file": "vD61dBNjswfyzfFZEmGg3Q2Spf+aDzM8XXZC5Cnal+U="
								"a hidden file":          "6JUhh6LHD4DP4hOlDjTpeIAEPLatxDNA2rGQqFtiy5E="
							}
							code: {
								"a code example": "wXPcH/7J8XcnjI/aRXDOiffKHzo+Gh9DB10Guj+rHj0="
							}
							multi_step: {
								hash:       "B2J59R307I1913F0459FAM40CTRFAQP7AHJOONIRQPH56QBS9QIG===="
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
