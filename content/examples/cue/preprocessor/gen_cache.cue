package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "nJtH/PIPN64c8Fk6/+ifYosoF03lPIVADsZHTP35Fh0="
								"upload additional file": "o/HKA1PctcPxRV4uE925UooT3iDpaLlkl26FtuGF7Uk="
								"a hidden file":          "CpD+KJfGefsguM2OfnHus9XiePfDu3lKcIXq7BguJ8c="
							}
							code: {
								"a code example": "Mw6gHQDzKv8tCckerGXHONgjm9l/XqsXGNv9ScdnUhg="
							}
							multi_step: {
								hash:       "QSN2POE7GAPRADNFUDT7N317VVQHCQ2UKC0UN5B37JVFIPEBORA0===="
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
