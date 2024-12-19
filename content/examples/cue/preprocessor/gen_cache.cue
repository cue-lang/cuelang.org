package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Vup4xsUipXtuUvbqa1y2XJ2czEXRx+mStdYnYL9pTAE="
								"upload additional file": "Ez18/UZ3B3AT8ggVFiaBbavfdin1SIcM5zfooKxhnrg="
								"a hidden file":          "XA9YUVru/HFjP4oO/3erTSjl8UdAMzGaS8rTJsfzMec="
							}
							code: {
								"a code example": "UV+qU9pKan+lIcawWIel50saF6dSp3RknoTRPMTF4MA="
							}
							multi_step: {
								hash:       "T9769LVHHJ5K8BSD2P6JUT6IO3FGFTC2419VB46LOHFKT1HDA7LG===="
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
