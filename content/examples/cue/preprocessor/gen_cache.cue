package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "SjEATg4IThen2QfpXKg887boIb8Mc4hwdZ86slqQGdg="
								"upload additional file": "ICjKL9bNzotQbRrVCt+fLs1KvM8Cm0uMQlGhAvK5R4g="
								"a hidden file":          "7Rg2cfS1sI6tQ1IqZxKUsghvUDABv2RoU35sEGYDYPo="
							}
							code: {
								"a code example": "zbha0FcJFhvu88CeJXmqpO0RzwhjKcM0lGgYRvN0hWE="
							}
							multi_step: {
								hash:       "P2RH0A8MS78P9LKOTBD4TIERNQBRALD52AN73VHVH5M3S0G89UL0===="
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
