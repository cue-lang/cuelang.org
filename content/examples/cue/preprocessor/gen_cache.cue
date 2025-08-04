package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "eRel9AzdxYhceP6/WjGRwE3AWxqRlNQDcUDEfSaEO+Y="
								"upload additional file": "KLLs0GG+mCul0OEam91PX6W92KEknFX4kuqkYGynYAY="
								"a hidden file":          "GxLQu3335kYXX99VtSUwCeR/I3nZi8uRtJklMdrcVBg="
							}
							code: {
								"a code example": "hHEo33xh+edJaN4lQp67984R1EOxeeTFcK7M/8CxX2Q="
							}
							multi_step: {
								hash:       "FOUFC8BVAI5STG95QF32DE0SODGFPE74T8VA0E0QBO7JHPIGG05G===="
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
