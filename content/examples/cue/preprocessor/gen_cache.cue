package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rXC+trCTR2bsHMH+b/uadyiuiRuQeqQFOWUutPv3Hkc="
								"upload additional file": "I6YCBuba+JVWMrlgvvC6Te6+flzPDKs2+IjgQr4EPHE="
								"a hidden file":          "oHgdF6vCEL8yLdF4FCBKOeMUm1ITN8O1F0/M8byY1VI="
							}
							code: {
								"a code example": "Giy0FYQgEQS5n93RaAnaR1wcZJXNdHw4jOKpx3GeQEI="
							}
							multi_step: {
								hash:       "P91H5H4BE5PSS4AFBV4UI7QJ2DHDT99PDLKBJSLEQ51V531N8DBG===="
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
