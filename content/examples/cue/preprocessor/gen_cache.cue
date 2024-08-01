package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "87su5o1sjKbl/HrYnAJa6TKPXtWNpNEVBIIua4F6HOQ="
								"upload additional file": "eBFYhaUmGUdH7xzEt+TKkuMfsniFhFh8IJjTdToTPhY="
								"a hidden file":          "LRHuZPQdY8g6NUPnH778kEbsTXNz0F3jsgUhpBjHGdY="
							}
							code: {
								"a code example": "x4M2P+cKmAFdMQPxjQL41Rw/F577BBZONvfCyKMGyGA="
							}
							multi_step: {
								hash:       "TCDH5KS1SR31FOS5LGDKT32SP6RN1PDAAB011EL4M45A1DPPKEKG===="
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
