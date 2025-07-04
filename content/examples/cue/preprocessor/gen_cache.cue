package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "tI9pnnj3Sfgs+I+mewsr1pldQ/0JvbY2m78ye2zVEOM="
								"upload additional file": "VlkDji9vHTR8hFYlsfLCl0s4r8KSiGvj5JLLpfnEDsE="
								"a hidden file":          "m1A9fgY+UvrhdvH5ZJ21KKHdFVByMWEDIUvU8un+DUY="
							}
							code: {
								"a code example": "P3zQ13DTkOsThkhEWWXJRSqJ4tBgpncclViqY8JZz5U="
							}
							multi_step: {
								hash:       "920VQ03EM9SADGHIB0B18EEJDP4PEHM1S0CT23UOV2FLNIPQS1S0===="
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
