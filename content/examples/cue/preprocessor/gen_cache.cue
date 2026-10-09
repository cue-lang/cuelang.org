package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "+G9Nk+jOx2DJasZiQbe0strjHZZCsQSNLIO2WW4/58U="
								"upload additional file": "pVZ30kWipEZRN/ky0utVzVRucLpROHxTCkNKRmfVf2o="
								"a hidden file":          "/9kkAXdZfw1IHI6+lOrOMi+gMZWt597PfkRt41TkGco="
							}
							code: {
								"a code example": "FOwqvKeWbe5x9UZKAD6RZLmhR7pheH9RcF2Twi6ty3U="
							}
							multi_step: {
								hash:       "QMVN55ASB0MHQGR6KB8FO2MD1LFU353QVLF0R8QH57VTA51G7PT0===="
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
