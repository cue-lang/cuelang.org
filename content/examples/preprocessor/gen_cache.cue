package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "Sos65dYk0t1cNCVERZ7+nDeEPUv9j8CRv6rtvPHDRMw="
							"file two":      "zOHIJgP+4uetM3u1lTSo0tG1gLZeCLlPWC1jtIVnm4g="
							"a hidden file": "CiBK9Vp9xVvlKWqZ7jf6VUMINsWulYjjXNY2RVZEbz4="
						}
						code: {
							"a code example": "Ws+0jQUgYzC7Yb4HpUMdJ60T/DlL819vpLNM9M1kIvI="
						}
						multi_step: {
							hash:       "OMSB1PDNJL9QKQ5J8RNTJS90BU1R7GIGSBGJQGTQQVH8HA8KBRBG===="
							scriptHash: "5CPCM3TVT40PACBAS4981GFJJUF95D1BEB33H8V7HUOB6A9O5ID0===="
							steps: [{
								doc:      ""
								cmd:      "cue eval"
								exitCode: 0
								output: """
										x: 1

										"""
							}, {
								doc:      ""
								cmd:      "cue eval >foo"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "cat foo"
								exitCode: 0
								output: """
										y: 2
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
