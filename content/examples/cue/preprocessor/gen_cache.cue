package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "K8O+4IsB9/gjP7w6V13bfqBiUCcTm5dCsCi63DbaBHc="
								"upload additional file": "sGO1hHb6sm1qkE3zDXve0QRFBzVXR08vVx6htvL71rw="
								"a hidden file":          "IDTwuUhUZ6v9NGdij+2efS2smosFQyutRlKcVARz/pU="
							}
							code: {
								"a code example": "d8G2uX9mSV//dnCH0UtC86P9ZnTjZokRxLM2S53RY9w="
							}
							multi_step: {
								hash:       "RFE7STNINNDBJLQPSIDOML9IE7OEA5DBEC4MTOJBB8KDNHL6NEDG===="
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
