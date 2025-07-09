package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "9rzL8CCThoopb3Ft3196pvXsFI9y/7Oi1om/yH0ufTA="
								"upload additional file": "kiVo+wkVvsQCp9s78BRNsgR+1eQjhjvB18W5g51EEoI="
								"a hidden file":          "SwyzawCr7XbwcLH8+Qyt050mVEXx8+u0BxTYCunoOGU="
							}
							code: {
								"a code example": "QoOmqTI65+2mfEw36ZOY1fu26Pd5G4lFx929pJDokW4="
							}
							multi_step: {
								hash:       "T62GVFB705AKOR64739AC0FB1LCMH4H5CEML2FDF8R0HH2G9TJO0===="
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
