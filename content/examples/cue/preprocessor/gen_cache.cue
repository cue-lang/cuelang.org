package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "PVKPdulQ8bU8xCTtCN6zZLCd+3hXhdANIBxRNCNCO/I="
								"upload additional file": "kePWaIC4Gyon75hg/8itsqL7nVtDNRzZP5p1oreN2A0="
								"a hidden file":          "LZ18U5NfoTNu4rwhRJPN4A+x8YlAcliivPu6zN30aEY="
							}
							code: {
								"a code example": "qBBT2+D1I3eIq0FEUu6uwly6kYFCI8ThgZ07R6lNK6w="
							}
							multi_step: {
								hash:       "3QBNB536TOA4HG6TB346NO7CHUJ5NIVNKKBCT2A8OT3L2VPDNKVG===="
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
