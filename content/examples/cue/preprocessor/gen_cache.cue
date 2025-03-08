package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "H3jwp6NDD8Zbj1bUOlXleExYb0m9tSN2AK3NVPgNx10="
								"upload additional file": "LVeaFDjU2KDWE7MBFjiCpqeexxo1t+LBr3dB1j/YjSI="
								"a hidden file":          "GCtxPU09tc4sIJaxpDRwhIjC6ytv+WouA/a4GAlDAn8="
							}
							code: {
								"a code example": "ASZ2tVMMvGalngGWo8Ya+Cau2RGxRYDlXE1xKPc65MI="
							}
							multi_step: {
								hash:       "8JF87P5BKOCCHN92C80AJJCD4AL0JUOGDOJ8802F0E6JGAQA0GT0===="
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
