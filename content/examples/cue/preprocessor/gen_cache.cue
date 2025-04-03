package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "sNzuJn7JLF87niQ0kSjdMc0FUpym0p1dlHAFf05Q044="
								"upload additional file": "ICcLjYtrFj7By4hr3NPXxn71XUDbMGytcMnLOuJRPcs="
								"a hidden file":          "puDvxVvTyIhzUohNNIDckU3TgLSR+B7HRIVEO48oILc="
							}
							code: {
								"a code example": "5fE+Tb9VARd5PQ4zAHhVmHxX06UzkXCKnwMTUKde6T0="
							}
							multi_step: {
								hash:       "RIR4L48JHER936ERNC7225E1IA7V2DKDNPIAINDK4A8DPQAIOC40===="
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
