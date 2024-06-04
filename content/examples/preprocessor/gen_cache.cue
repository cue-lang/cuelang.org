package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "qT+Nx5k36YtMF/mBaU3zTYVdHeMHAPFESBaiRk5s9FE="
							"upload additional file": "ETP9Oi7fObgQcQrGFt0nai//CnRiM6idEP9Mj7I7RqI="
							"a hidden file":          "LGIlC2NoAcCA8tkzPeDHwBP9EDdmPIeIk5XE6KfrSBY="
						}
						code: {
							"a code example": "KTvDBwJImYkSIKpFZy2gLoQ8X/7fvN//2krORo1yrB0="
						}
						multi_step: {
							hash:       "08VFD0UFLI3HTJ81Q3DJFU74F1J3ORBRC38CK1AMB43D8KRE3SM0===="
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
