package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ak/sEKDpBO8Ntzc/Fuf5TSwEp4DO9gZO13vdXiWNW8Q="
								"upload additional file": "XzqU3Bs+ec7Hd8WUG3fT4Lo5QWdVQTSfux/ZAcTe8wM="
								"a hidden file":          "VRSal7MjyY/kDCzt7FmlydBxk91tJ89jmDM5Fr+ZWGo="
							}
							code: {
								"a code example": "VtdRwzSRYSup0h8rYlO2gx/yuyaUjcK1w24XK1yeJGA="
							}
							multi_step: {
								hash:       "V8GD2V988KG86USN28P5VQN32RBT8TIE5TJHCM66FH2QVLVBCV8G===="
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
