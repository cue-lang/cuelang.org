package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "S5yqJPhDbZkqRypNVj1351e/Amw4mALVmswRp4T8n+A="
								"upload additional file": "0iLkHKhwh6DNfxTQ0ZvoKZv8cLmZVfvJyWXMBF/R1lc="
								"a hidden file":          "ZG3L+L6JwSYbY6vk6OgmcEFFkczsuHyOQN12oUY3Hwo="
							}
							code: {
								"a code example": "nz78H0lmO4xkr/6NRrCB3bNpvIt2wNcvahO33PQova4="
							}
							multi_step: {
								hash:       "OBM2AIQBIENRINV4UGLG9CBQ4QHLR40GOG8CFDJ9GPNO83ITFNO0===="
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
