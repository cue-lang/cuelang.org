package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "H4g0IBZ/KQnfk/Ky5/oDG2F3SU/VlxImdL+Ppt7a77M="
								"upload additional file": "nsD3/0znYnXilh618bXzJhHP+qPCR745U/rE6twob6U="
								"a hidden file":          "Uk2V/ENs6Wve0hLCAAfjpwOUNWgOoQ98qO4nVBzuvz0="
							}
							code: {
								"a code example": "fK3FmsTEX7BR4Yp1SNec57N6oaKomkGe3Gfc7GUnusQ="
							}
							multi_step: {
								hash:       "R0V3QS4276R2Q8LPQLFDM3IQLOMNOM2A3IH38CLJV8LM3MO85RUG===="
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
