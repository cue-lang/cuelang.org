package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "G6j6aqhia4uMOaVDQ/CR+vNbtUfGrYO4Buy1nZoDve0="
								"upload additional file": "Lyt3j6P0jHb2gNzwNBRRVUdxdhRZEhsH0NSUO97YXzI="
								"a hidden file":          "Fi+afu8ujDpG7qtqYWbBmaI9c1z+0u7RRttmtVte13s="
							}
							code: {
								"a code example": "vnDrfeXfdLMVnO45VR9CsNsBCBq6cTam0bP0VffUbcI="
							}
							multi_step: {
								hash:       "RM1TKAU9KG8V4655OIG3GSNN5OCCBC9LKCKGJIP4TR7E6TI92R10===="
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
