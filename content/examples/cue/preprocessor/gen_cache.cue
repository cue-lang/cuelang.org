package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rJTXLoQCR3T10F8YMF/a396zpewKLzoLt1uWF5dVtJE="
								"upload additional file": "Vl4W1tY0OBELe9weeuRpfOmRbTJN8399Uls9wOPa9Vc="
								"a hidden file":          "eKn9uMPKeVnBs7i++X5KSB661zzPTWjvo5HGYrCiHC0="
							}
							code: {
								"a code example": "a/XN6y47zqSruVct9ehCpIyzp6PYgfqSQQMLeVOn5OI="
							}
							multi_step: {
								hash:       "E8O4SMDFO36EOASPS9D6KQ7U0RHJVOR4IQ3NUDF5MF5L9GFL5RK0===="
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
