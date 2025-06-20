package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "nHXSWSOCQfwIUWfY4o5WITpLiA06YRZV/oPTBqGZobM="
								"upload additional file": "IbCLeB1i9SlAveQmTLZ0Cpm8jnPqDkGvNC9P3PHUJJY="
								"a hidden file":          "DQKhSDMMYTUpnwfwRiQp52H11zRlyOV4F0bm/8ES1NM="
							}
							code: {
								"a code example": "sPX438B51GlCOLoU7sSja0doOgapDg5hpTy6TwpWpTA="
							}
							multi_step: {
								hash:       "PTJ82E7R5UMAHMMLBUSOREHJ572KQUR61Q9BQVPPPNNPQF5SO29G===="
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
