package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ZTzTRWp9wiubkGIbe7VW4mkQYJLs4ESBJ5G2WKftPEg="
								"upload additional file": "jwa1Ut6P871ZvCAVMWmV4jQtQgEZSPDHeMLFVJ9BFzU="
								"a hidden file":          "GOuMWLLdTzdKU7ixF+faSbHCjni1IkY+ESk+FJfp89s="
							}
							code: {
								"a code example": "TAH5h/CL+FnTzgxHe8zuRZb0KizB8K5WqFSVxGHYauM="
							}
							multi_step: {
								hash:       "8VUT5Q4EDJ5D7BDDDMDFFIVTJ5JBJDJBS7I0KDVNNLVVO160F3B0===="
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
