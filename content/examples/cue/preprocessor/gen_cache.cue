package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ciV3eto/ytciuh+CICYtThJvGcj3JhTC2W/pa4vhots="
								"upload additional file": "/TasqBdhPk4eG1BYzfqY4DJFmXjyO1DOcnVKmTXTOes="
								"a hidden file":          "k0XA1wbXDOlWhGrODSdVmTU2L0Gz6oIyJmOf1YHTsXc="
							}
							code: {
								"a code example": "FhtJ3gW2nXfeOapgN4sXRY7XPo4u38B5akmVc0gSsUY="
							}
							multi_step: {
								hash:       "5J1HCPSI16A3SNJTS6B5Q2VHKGKNBPRH1PQ18JB6Q08F0QGLVGTG===="
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
