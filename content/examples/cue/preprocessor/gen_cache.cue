package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "K+DH7xLaMg91IMTM518RLRMqI8i5T1XYq6dffylJwL0="
								"upload additional file": "g1/+84dnEIEFtbOYxeqkFC7QkM+dztATdTLwPSdLf8w="
								"a hidden file":          "KRca9rj86TldB8A6qS4syy0NxVz4txWnxQpaaWm7EnY="
							}
							code: {
								"a code example": "08BdqIlaHEmldDKSrUdtaG4mf9gwN6aXUyZDGbEnJy0="
							}
							multi_step: {
								hash:       "6GFO8MDO6KAGVTQ0L9NMOJN2JEJ0IG05QD1E1MB82LTR0S4RH8B0===="
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
