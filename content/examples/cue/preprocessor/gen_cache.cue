package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "xX5JI4HtTH4QXZYh2h6Su2+j41Y8fF3bEbXte8cRTcQ="
								"upload additional file": "CL4tOstHP3D6MFWlC6+Txmxn8/Vxhrj0CwCn2L1oqIg="
								"a hidden file":          "PQspyWtBlZT8sPOSpbnPUx5YbF3sK6NLKpdnWIgWIxg="
							}
							code: {
								"a code example": "RNzoZYkrFNKKS3usJN9ecS1I9D0IaTYxjVtX2rKLNX4="
							}
							multi_step: {
								hash:       "5V6VNFT3LMS5LA09M0T0J76UV6U4270MPO9HIEK8876RPUU3UHM0===="
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
