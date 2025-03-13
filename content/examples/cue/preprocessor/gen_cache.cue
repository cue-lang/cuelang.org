package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HCVaR1Ce8tfZbdX6a5z18h7CzYlWWdTgKVR2HTJb7Sc="
								"upload additional file": "jpdMFrAu/O/QHPKl+vVuBBH76UbtUMrjN9LAsJNW33E="
								"a hidden file":          "RqHes9V1SxeD/kSAeJoMJzyuV4hNVGfw/t7ZctIWxks="
							}
							code: {
								"a code example": "n0SoJMgYmtR/QzxO8kmitzBSvC74eSnQrd2CvhRIJO8="
							}
							multi_step: {
								hash:       "VREAK6A2N6OGKV7IPR7G0OUCHD81FURNBN3MVGFJQL6PSO17V3NG===="
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
