package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "CcK/Xj547tv3dDOe978WBFaSTB2DaOlyJsgy8xGFKqw="
								"upload additional file": "L5hLTwqg0wHhUNGFfjbZBpD1rTpCotSGLL5GUGDEyCo="
								"a hidden file":          "k9N1hvs1BuZL8N7aqNBQjRXehZ8ydNo3HncCahfKnVI="
							}
							code: {
								"a code example": "rxnvMBkEIKMRZWsZBINdeCiGAch8RH7zcYhQc2b4pV4="
							}
							multi_step: {
								hash:       "IO46VRM7U4FES251Q44L0LF83VNLBPEGEOM22G7TON1BOL2NFOTG===="
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
