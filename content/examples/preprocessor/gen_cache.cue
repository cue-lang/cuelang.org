package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "MzWX+71whK1ExvbxJ2iChj9G3NzoB/XacWXugF4LsFg="
							"upload additional file": "uuxvO72gidyo7b0IXe1GzbDbZ7kv5FayqUyViemvlVI="
							"a hidden file":          "ucSDEUUNxFQ6s5xZHddJ6NNqO+4Wqjy9LB2thhoMwqc="
						}
						code: {
							"a code example": "0+rTRDtlTfLQhlsOrWKdn2WBf7Nm106htq/3s7ScEE8="
						}
						multi_step: {
							hash:       "64IN14K7GQABJBGASKM6ANL9FMO9L2FMH7IBECU4UJRG7NS27D7G===="
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
