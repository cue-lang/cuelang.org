package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "6/xUvN+5/gUbbPR5lha+vOGYs3bg6A6nTIPqe3wKxAU="
								"upload additional file": "tDKuLemLzKYk2y7wwqsxSBIccMrisG4kWY0MAhp2doY="
								"a hidden file":          "VBakoltNqaAHQRMfAeahhVqLRjmaSHeAc1yqO3dZLoE="
							}
							code: {
								"a code example": "nY4OH/B23Xx+o+uscwLm58nWPSSpNas8HBv1dlQKBFU="
							}
							multi_step: {
								hash:       "9D7CMKPRCLSN4HNIVVIUPK4TGCVC33U0HUVGLVPBB3EGFVGA1ITG===="
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
