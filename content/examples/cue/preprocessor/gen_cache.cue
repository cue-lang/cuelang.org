package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "C9BglXA5UAj4Q1a8sCwFt9GpDnEMAE+YnGC97HhFjuA="
								"upload additional file": "zmSb9Fy9kBVCr/BX6wmu01N55Fen8uwK/3o0YW6sfck="
								"a hidden file":          "TXwgVWwPQKsd1QUOoOEMzg8IAVSYpEq5IZ371bMQ/O8="
							}
							code: {
								"a code example": "c+7i9CyW6NzIx32MOkEMT3zlQmZn1kWqHWR9DctM0PQ="
							}
							multi_step: {
								hash:       "L46P9KC0A63HCILVE9RQFFF3C11NDB03KVPN0IJJIB9DNGFU16HG===="
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
