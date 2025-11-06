package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rJzDWa3FsxXW+sSS1aI1/W8k6m7kgwTJ08E2BvWD+8A="
								"upload additional file": "Ox0Og1SMKxJeI5zm5yE94Y65nbaGvaa965+L4VYC1Zw="
								"a hidden file":          "CN5TXWH0zgMf/7gCiiKjSnIn7m2zB92h6zBiiAQKgDA="
							}
							code: {
								"a code example": "Ada5aRGfNUGbbGKhf1z7BlDPQCafso3mhCZE5MJqaFU="
							}
							multi_step: {
								hash:       "QJ837KLF67BO24NF8O1GUM1CFICHT6C80F7JJ6GEP8P9AU4C5GCG===="
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
