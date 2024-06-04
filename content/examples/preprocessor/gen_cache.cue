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
							hash:       "M89I0K1Q2ESLDSLMQR5DT73QBJUN38UM7KC8CTEF3PQ040NFMFM0===="
							scriptHash: "E5NI97NUHDU688HAUL4HNFJ9D89OK3NMLI3HQ5QRFJ58GTDJ6GAG===="
							steps: [{
								doc:      ""
								cmd:      "cue eval"
								exitCode: 0
								output: """
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
