package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "bb//r1hGtDrtoxIJ3Lp5FhabR8s7DAf2iKEgl+Z6YWE="
								"upload additional file": "cdqS5uDb1Epq/eZ8gkTTSeYBg3bdSVyrSN78Zea8By4="
								"a hidden file":          "sTIPCBCf9qZV03F/nRHuef+z3z06yHSKYvn4WDboofc="
							}
							code: {
								"a code example": "N1NOUu1AT9j3KL2mqCXkgf9RFdiLRRuhRv+HMlE2HAI="
							}
							multi_step: {
								hash:       "UC3G3F25DJRLT9NM3RP5I9JJCQCLFP4FL28ENPIVE1IVODG8R7PG===="
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
