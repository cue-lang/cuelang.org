package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "7NKf894lPvLExis+Dh8In1LDo7GIvGUDRLKf/u1183g="
								"upload additional file": "QvFYsAdLOJ3NBBRaNibpB6ww5Z/YvQ4u2hTp+T7lWF0="
								"a hidden file":          "XzXjyiGQ63RLBEcVtmYEEs4uKXFfcqpyzMjvz79FkYA="
							}
							code: {
								"a code example": "dEyyZCgxa6Wn6L44am7OkypPo1JXplLY+Cshgh3UKYg="
							}
							multi_step: {
								hash:       "K9KJPK8H1OHEF9TTPUDRL30IGQ5VPI0B4QSQ43NMS7U8LDV7EGVG===="
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
}
