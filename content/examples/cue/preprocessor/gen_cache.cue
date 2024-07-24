package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ek8EIvayvYZWmYIK5mPZUXjmpgLHMoXj6eckwsajhdc="
								"upload additional file": "qoXhuM6w6EAiH33j7YZF7DWpaNbXHJpBTSUzvOxymJY="
								"a hidden file":          "aQm0DghX24Xonf7Dih0oHkJHZ8CnvdyoERW2DrOidlI="
							}
							code: {
								"a code example": "eD8ZjODP40hZr9svAk23ketRUpgboc1lSogSihy2hA8="
							}
							multi_step: {
								hash:       "7P2RVHLKVAHRPG6EC309TP40IUG4QBSI7SKNP18FDSKVQQBHDPT0===="
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
