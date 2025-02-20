package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "plrYDYL35MzypLnNJpUoQc3HuQDcKvUkERyJ8FAMAMM="
								"upload additional file": "Lk9Rwp1Gxp4Vyu3zQu46CxexSmxfD+9yzo0YDNJaDJA="
								"a hidden file":          "giv1/mtJxNKa86laFbGpryf/ebViKV9FOAWNM8XspRc="
							}
							code: {
								"a code example": "NHjG+cwA8MPuZoKLFrCn7RKANlIV10ZuNbUc+EivN2U="
							}
							multi_step: {
								hash:       "BSA4BLLUNIBDPPGJO1G899V9R003AAJCLV31NTOJODJ09PM18GMG===="
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
