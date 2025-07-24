package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "3ccdPti79a1joUs4IW4WfKKyHS4ygyy5PhVMChmYXRM="
								"upload additional file": "ppUXS7Mo42MYtvion/V4YweQau94gyH/slC/KdMEAxY="
								"a hidden file":          "X9TOKNapG3tDB/nLxv0/L9LpByBWCU5DwDK/3BmIr9c="
							}
							code: {
								"a code example": "LwZiOP1vXi3C3mDDoNzmCT81DgpeoABFtd5ooVVammc="
							}
							multi_step: {
								hash:       "V9T9F8FDK4594BDTINPUMDJ63H2P0MFI33Q1CAOIHFMLOHHBSIDG===="
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
