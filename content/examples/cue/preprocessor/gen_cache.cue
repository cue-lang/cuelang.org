package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9LBbtddtDNqZYOlnMVxFGuE3qeJSnC+hk9sDDt4BQNk="
								"upload additional file": "8sfQxNd2cJ8pxciIPtb4kkTivfysOGHjDJPChOpkMCA="
								"a hidden file":          "ItGjZqaoPXflGxUCAgaX103aU82OH8WB+2sV5stepOE="
							}
							code: {
								"a code example": "nBYtMqVT+gZvdLbxp6pQVmFd2JRVWPhUiKOdA4o/Duc="
							}
							multi_step: {
								hash:       "MPNPB9Q0LDFODP74HBD0GG5HBCC2HH4RI6TBEAHUH8I6KOSOVDQG===="
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
