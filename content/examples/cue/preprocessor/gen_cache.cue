package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "B2wJhEAizBPoRWObtds83cfcabfcAZow7MdFhswUVJQ="
								"upload additional file": "tbQ51kgobgvKMCs+9vxr64bA1X47cKYQ3Jgx8HJkQJo="
								"a hidden file":          "SdxVKHkFHIY7bGrPZWvs16r0MH/cshRlM047S6/ldyY="
							}
							code: {
								"a code example": "NA01bZ6cylnaPFr7rdg+2ExEdMiNgonDZP/70sBR7f8="
							}
							multi_step: {
								hash:       "9PCMVOE2CF4PQTDITMQC031N2CNI0E4F570088Q6L6VMOQN3T82G===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
