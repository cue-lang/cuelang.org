package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "tmDTUTD9OzWIcs+hE9ej7efG8PTU/OZMrmXOm2qyEew="
								"upload additional file": "fT225yom54S92dEGXD0yEIQ9lahE6tZXpCMrELftFuo="
								"a hidden file":          "Fyn+OvSRf/RJ2JvWRLBT9z4HVQVtxg5q5bEtidUDVW0="
							}
							code: {
								"a code example": "+Vjh9lEcj4dCQyyZg1F65Qg+Ga3U3t1bg8s9c/KMBJA="
							}
							multi_step: {
								hash:       "4QS574BQ9FFPQT7B61QDHM5Q5I0U4OCMVJCSEUO1SDVH34A1P6K0===="
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
