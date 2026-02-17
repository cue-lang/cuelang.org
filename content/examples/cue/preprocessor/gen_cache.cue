package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HpTdmEWIKGynNJdGMlCBzkbtjmv5NzslVgrIkHT1cGE="
								"upload additional file": "IGucWrJL56vO1qRUR+opT2TGTjYOj2p/Ahd8m/mK9Ec="
								"a hidden file":          "hbHuai5Gb7CbUPiejZryiogyxrzuLRX/EzCOM7gZPYQ="
							}
							code: {
								"a code example": "UkUqA9kYWzAEdVFNROqWw+D+ESV0cxpOV8FobmCBAVs="
							}
							multi_step: {
								hash:       "820B7ATTVGTB90IBJQ758G3R0E04D6IDNPNKVQVO1GKHNVJUUVSG===="
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
