package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "fettKm4qZKlI0QJ2+QZH2CT/8CQN7KA19SqjD2+6A0g="
								"upload additional file": "xVRfFdz5WlEfMOEpeVw8xZW7e48wYWFNIwJvJBQ/lPg="
								"a hidden file":          "pxS8qrFa/msvb4Qf/Yzkmri3OxmiGjlFU1L8xGRlJlk="
							}
							code: {
								"a code example": "a7dff5IA/M93L/llIXzTnf0LxaCaIL7VX3D6UUTW28c="
							}
							multi_step: {
								hash:       "RLPPV40Q4JAI4QOQRQG6JVKAD32QAKNMLPAKAEFD1U80006F2O0G===="
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
