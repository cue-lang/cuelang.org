package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "/odUgJo7N/QOvI1vi8NOY0jKZiHqZN7RoQNqJFuJiXU="
							"upload additional file": "n54R9gE0xBgx7DW52o8RJU2O8piQlfedEH7BbQn6O84="
							"a hidden file":          "UZh5Mwr6Bft+F8cGLd8ekJKDXQr9arQ1+Sp/RJnPeGc="
						}
						code: {
							"a code example": "UEeE4v1fRDlXkIpjvebZS90Qg06cpVjhmZ2Rkp52ZgY="
						}
						multi_step: {
							hash:       "VO1IO060UH8VQCV4TG4QLGM0BMRABVNRNLI995SNM4BTQFERGDD0===="
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
