package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9sWAn5SNfEieUG/s0A7ylAPR2FEv9/iyNm0VyQ8bxWo="
								"upload additional file": "s5U6EgJITA7J7WOSB0t9XFS/KpbsQEfz+9H2DJyz+Og="
								"a hidden file":          "GF23DslKiBWa6kHqJtgFs6tVobVk2dzA7tuw6xZ4SCM="
							}
							code: {
								"a code example": "pjN57L+jKSUjEMnWacMSEg/GnnZq3Ajch4R4MmE+XYQ="
							}
							multi_step: {
								hash:       "LK5U983OH2L8LFAK5OHPD0OC6OJ28EN1B1714O41Q6J6JFBTKI70===="
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
