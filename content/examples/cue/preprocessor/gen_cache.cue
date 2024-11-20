package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "tFHAhpgssaceKOSus2i774Jjq9hhIoFpnnRuwFN8ZOo="
								"upload additional file": "3yU34eivWOSNiNGi8E4+Y16POkdq+th+bXiqTUHNVmU="
								"a hidden file":          "h+mn+44j7bMLTwPdu1vGIUOxHrzM6WrzqQPsgBZIPKk="
							}
							code: {
								"a code example": "kSJ2huyXcwuvLkJMuSmA61xnMsCFT0v500alWM/WA7I="
							}
							multi_step: {
								hash:       "8K412DKTSVMP1AGLIH2IKHJUM7RD3HCN07IUO69MVINQV6SL0OQ0===="
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
