package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "wouseAYFhehGUC1K6LJ0ZS1R8fHowyBWwibldBgQyuU="
								"upload additional file": "UakmkSw1/IvwxGZiiV3Yst+X0HTu4i6oBK/PnuV+2kk="
								"a hidden file":          "ZWHU3gEJq9RChiNeZl9lWo0hjv7yWAvnNK04qRpimrM="
							}
							code: {
								"a code example": "+fIahLSdCZZ64ZJTqFAmt98eCmid6sbqlPKPqXCYBgY="
							}
							multi_step: {
								hash:       "FUBFT4R7G109POIDJKK8EMN9B1H9BCUVQAQCIPQSF3LARADQC860===="
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
