package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9HgpJsAoWlzcEjqUjkg+KN3jhyX1utoI9ngXVcwGtwM="
								"upload additional file": "EKPCbbQsKqmxlzs1hmwL6w+aeOLFh6idDtfAqClq5OM="
								"a hidden file":          "cdEpi3fbp1sTNwBnaVJQ+3hSamxhWUyZha1cgcONNjQ="
							}
							code: {
								"a code example": "i3kZJwm0hTKz+Ibw1nkNJTi9gCvabP5Zw4Bdrks2jBI="
							}
							multi_step: {
								hash:       "2C36I3UST68M1AQN108IG4GPI5UR3GGJ8KJLB33HMLFBNI8QEMR0===="
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
