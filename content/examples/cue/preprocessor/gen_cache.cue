package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "m+fHZfKhvNlFO3CtVL/5BXMEnhAyx4dKvl2zAZu+BSk="
								"upload additional file": "wBU9tvjhgJDVSHNZo7Z/BwvH20wPe+QBu7DOUdWsXgs="
								"a hidden file":          "bD4UD3Nt+D2Kai3DJP3CuBuyK1h7HJx/RC5HSfSCHrY="
							}
							code: {
								"a code example": "4jsCFU2zWXB/7AsY0qZUfeLVx1L1qFEAu/vePDu+U+w="
							}
							multi_step: {
								hash:       "LT5764VTD4ACTAMOMQI6TERAIAV571CGA1P6ATJ0RR3SKDRHKDB0===="
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
