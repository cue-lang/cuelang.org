package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Bkee9NNXjoGKdb7IxjlqfE7aYOGOKGPw719ITxQbb9o="
								"upload additional file": "ILxbcN3f2JX+f/3Il07z2ldrD8yUNfdzLntCZRvqyvY="
								"a hidden file":          "J/VFdq8NRnINhuhrxFR3gxutax2F+fsqcGVxYdKm0q0="
							}
							code: {
								"a code example": "FJ1F4mGXG/xhXq2P8L3aIXSSvrsEIQfpJzv4TyynCOo="
							}
							multi_step: {
								hash:       "35KABNEF1AA4LCE8PBJOSNDNTT9REMDMTO75ILM832K08N720NDG===="
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
