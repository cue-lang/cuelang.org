package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "qWADGlR1qKu9hh7Tqa+/FTSicTC/5Yz+L1HoCU3RkV0="
								"upload additional file": "nV+9nZPtWaUDmkfZ5UairyQG/ZRDO7UH9WoOur+fzJk="
								"a hidden file":          "oCmXTRQ5JIhabkb6DPZJBef9rPTh71D/XzIvgHZ4hAY="
							}
							code: {
								"a code example": "PcynrqyVIz2tOM0sWUz0AIC766kqEB7w+0rymKFv29M="
							}
							multi_step: {
								hash:       "NQFF6Q80HCML49B9HA7CJHG4A5D4L6284B8KE3GAGPQJF04BGF7G===="
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
