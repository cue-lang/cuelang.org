package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "2fjMCf3PJob38g/iOZRfvex5Io35qlKe1f4nGPURf1w="
							"upload additional file": "u1h61Vze2HzRl4qL4da8WcZK4DSOG2TE1BaqNe89ufE="
							"a hidden file":          "K3rABiIOCEu5VuIgjms19Oa18X3M6beyofdqdukcAE0="
						}
						code: {
							"a code example": "wUCKQk31hYIzK9d8zDBXvelXdQXvXlrcuqY2y4iiumE="
						}
						multi_step: {
							hash:       "EI9HMCFLAK8BCHFF67QQOCBQ479OKIUMG8K7PLENBF4OJTUE090G===="
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
