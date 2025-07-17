package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "vj6GCuibCsf0eEpP/ZjsBto1jGvCuzC4cr5hAZSjD84="
								"upload additional file": "vpPyseW7gytHtzPS/tNoh/L5NfxsR33PkAaAZiXaCQU="
								"a hidden file":          "y5qJoubUBWKUTc9Hbqcq2WtDKK9rO/aa9bqzej4wzLo="
							}
							code: {
								"a code example": "/HZXlLHjdvVv09NgKoypCqJA43hiyB0wOQF8EfZMaig="
							}
							multi_step: {
								hash:       "VHDV9SJC3RSST6OL1TFMOVVISJHFJDLCSIA62IO0DAL9UAC34BV0===="
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
