package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "fCHIomrJxu5uL2M26TMIjNtNoOGLwVzAAXpjsFKxymQ="
								"upload additional file": "7KT7oO2y4YpI7ClYRuQVVnDgAEhdgK6KBnTi0+zBl5A="
								"a hidden file":          "7tC/Tkrrx2Y0Sk3oKqYP9xY9lJ0AUW2KE1L5RH7lIgE="
							}
							code: {
								"a code example": "jkJeF4oHrrN0lpgM2Q49u3tGlFrn+ENxc+3YITyezz4="
							}
							multi_step: {
								hash:       "C7NGT8IVG5I0A3K4054LORTGN30OMNODR3MUCS01V1VUHL24RIK0===="
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
