package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9b4eqztKlkAh8oyDrHiP37YPuRbJxn3GLCVlnVhfYnM="
								"upload additional file": "n7yiLBBLlL8iese6jDvaMcdLByuVGZg61wFTFWBvtBY="
								"a hidden file":          "weQ5fHoev1ndfbka/mFbL40OQzxJXkbbgToM6e8U/dU="
							}
							code: {
								"a code example": "PxvhQ0QdSPRGCPsYWm0UCaOyAaw1c73QjG621oBm/qU="
							}
							multi_step: {
								hash:       "B33B4NJOSOK7OURP9FJR4M11F2LOFE7J28R46PLF30S6PN72E0V0===="
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
