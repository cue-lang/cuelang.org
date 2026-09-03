package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "dbj2+zQb/i712mB/OVHuhwVrFG8jUiTjf3iPB0l/EKo="
								"upload additional file": "2Jx2fBx52BGpkQQTtH5HcIB/SHPymZI6mbFYtZg9el8="
								"a hidden file":          "N22x3gT/RBmhtKBS1QWKQmKEbSDHrKYiogou1pR0OzQ="
							}
							code: {
								"a code example": "BKC5KHG3ADK5IE0ONQ33CnmH8f0Ie0mj2WUBMHuSZzA="
							}
							multi_step: {
								hash:       "FP578AIMN62174704PAPDFCLP1RTH4R9D68OQFV99O46H2AUILA0===="
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
