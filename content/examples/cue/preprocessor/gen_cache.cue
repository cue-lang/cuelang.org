package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "uw66AxxXQVoafPA2MctvuCLy6gLpI+mdfnNxVR/UJTQ="
								"upload additional file": "f4Ru8PSwqcZA3uuoN1ZDQ7qXgriOJ3im20dA4PDvljw="
								"a hidden file":          "ecrooCqNlhykITUKCVYu+SNeX+iNNPOtfiUb8Ejh1Yg="
							}
							code: {
								"a code example": "ulab2dCqgQT4VpCM56tIRj3/fBYeAHDvmap2FMvCCCs="
							}
							multi_step: {
								hash:       "RU4FTFGOKIELLJIAOTCRFH11TK1V8DAMIVD06IS0CLN9319JR4HG===="
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
