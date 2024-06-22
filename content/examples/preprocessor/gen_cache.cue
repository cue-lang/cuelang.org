package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "SGqHcumunB/fuUAYDOPtbqkU6JUGRUQZqfO6fbXj5ho="
							"upload additional file": "UqaZ7aO+4Z45zwbIrl9UrlBn7cltvq7Unf4zuIfk62s="
							"a hidden file":          "YClaevNYKAenxgIuy0xEKHqWHqel3MYxsJAmVDX+0dE="
						}
						code: {
							"a code example": "P1H1sHs77s/VaoLajV+0Oe+T6AOL8h5VhjOCmR0sdOQ="
						}
						multi_step: {
							hash:       "ACN6JVAS9LUK3EFR29GF8EUJAELALSPG3I05LFFP8E4QUFS5BSBG===="
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
