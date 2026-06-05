package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "TYQ4Rvz66WUVrlciCKzmTEbRRf0pGsjtyTcFoc5dLsA="
								"upload additional file": "IVUFWJB6z3idI/TOOhHY7Qv6/4eeONkeVHmrmnEROEY="
								"a hidden file":          "7ObsH0Pc0vINJcZsb+iNCnCr3PRQtPCXqNosK021AFY="
							}
							code: {
								"a code example": "EL/0kKipi1C73CtBZN0JUkqJsCXroCOOe2YRKZAvrws="
							}
							multi_step: {
								hash:       "ICSC4VGQI3S1U0QURCHKM3A6339VE3HQ5ATAJGAQ08V99597S3GG===="
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
