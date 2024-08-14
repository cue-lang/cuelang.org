package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "cl1oJGHP2PsSx36sePrD7pUuAhTQmbGx2HcXqrkGsA8="
								"upload additional file": "ngontDF2AlChMxIjFCtY11xhffj5gq91rBWc53MaCK4="
								"a hidden file":          "REEl4xr8SZDON/K62a9qF1bgRlujsSUQUCsXKdLcd1w="
							}
							code: {
								"a code example": "bgEdGl1VNN4wvadIc+8T8rpliYCRvAX5q3tfgSOEC00="
							}
							multi_step: {
								hash:       "6RRP1JCMG7ABFBONHHH0RE9MIDO365L9CPIQIJEUCUVELBKRKC4G===="
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
