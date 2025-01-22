package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "OdXHXA52QbOJwVwxqTRGm2YlQAsfZ2e7Y18ICzZ6Ois="
								"upload additional file": "PGUfvtMj48h9Ddh1McmQfa84OjHDlABGplUYZMJzqe8="
								"a hidden file":          "fw7VfXI/TJceAbbai0wRaskdU43uw+2BUqcOpCPsBw8="
							}
							code: {
								"a code example": "n4vh6Wv8uXJiuOQMTdFEgBjo03TnsPowqJ07g5ECJJs="
							}
							multi_step: {
								hash:       "2R3NFQQN40JAP53OE1JB0RKDGPFSROBTCP31OKIESHU9SKEMSTA0===="
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
