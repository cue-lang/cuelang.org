package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "K+l2QCrldnHOuIF3wGYhjXDR/pDJXvLixumV6shZ4Pk="
								"upload additional file": "F5kM4P390oOIZ5ikIs2hdcFrkxNEkAJwd6q9IeURAys="
								"a hidden file":          "2ACvk7n/wKN48Y+KVQ9KdpU7zpVbZDXVRhFt5Zx90iI="
							}
							code: {
								"a code example": "rOAeYsT/5rlURqQfZiKDEgBLikrfUHvxRFRGLu7yOKM="
							}
							multi_step: {
								hash:       "2FB7DSBAA60F1M9SB93N49P2KHQLGHLUP7CBBCLSABFVH1HO2F60===="
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
